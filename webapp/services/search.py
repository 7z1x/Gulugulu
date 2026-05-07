"""
Search service – TF-IDF + Cosine Similarity + Fuzzy Matching.

Memisahkan logika pencarian dari views agar lebih mudah
di-maintain dan di-test secara independen.
"""

import re

import nltk
import pandas as pd
from fuzzywuzzy import process
from Sastrawi.Stemmer.StemmerFactory import StemmerFactory
from Sastrawi.StopWordRemover.StopWordRemoverFactory import StopWordRemoverFactory
from sklearn.feature_extraction.text import CountVectorizer, TfidfTransformer
from sklearn.metrics.pairwise import cosine_similarity

# ---------------------------------------------------------------------------
# NLP tools (di-inisialisasi sekali saat module pertama kali di-import)
# ---------------------------------------------------------------------------
_stemmer = StemmerFactory().create_stemmer()
_stop_words = StopWordRemoverFactory().get_stop_words()

nltk.download('punkt', quiet=True)
nltk.download('punkt_tab', quiet=True)


def get_stop_words():
    """Return daftar stop words Bahasa Indonesia."""
    return _stop_words


def preprocess_query(query: str) -> str:
    """Bersihkan query dari spasi berlebih dan karakter berulang."""
    query = re.sub(r'\s+', ' ', query).strip()
    query = re.sub(r'(.)\1+', r'\1', query)
    return query


def stemmed_words(doc: str) -> str:
    """Stem dan filter stop words dari sebuah teks."""
    doc = preprocess_query(doc)
    return ' '.join(
        _stemmer.stem(word)
        for word in nltk.word_tokenize(doc)
        if word.lower() not in _stop_words
    )


def get_fuzzy_matches(query: str, choices: list, limit: int = 5):
    """Cari kecocokan fuzzy terbaik dari daftar pilihan."""
    return process.extract(query, choices, limit=limit)


def search_makanan(data: list, query: str) -> tuple[list, str | None]:
    """
    Lakukan pencarian TF-IDF terhadap data makanan.

    Args:
        data: List of dicts dari Makanan.objects.all().values()
        query: String pencarian user

    Returns:
        Tuple of (results list, suggestion string or None)
    """
    df = pd.DataFrame(data)
    df['stemmed_deskripsi'] = df['deskripsi'].apply(stemmed_words)
    df['stemmed_bahan'] = df['bahan'].apply(stemmed_words)
    df['stemmed_nama'] = df['nama'].apply(stemmed_words)
    df['combined_text'] = (
        df['stemmed_deskripsi'] + ' ' +
        df['stemmed_bahan'] + ' ' +
        df['stemmed_nama']
    )

    count_vect = CountVectorizer()
    X_train_counts = count_vect.fit_transform(df['combined_text'])

    tfidf_transformer = TfidfTransformer()
    X_train_tfidf = tfidf_transformer.fit_transform(X_train_counts)

    results = []
    suggestion = None

    if query:
        query = preprocess_query(query)
        stemmed_query = [stemmed_words(query)]
        X_query_counts = count_vect.transform(stemmed_query)
        X_query_tfidf = tfidf_transformer.transform(X_query_counts)

        cosine_similarities = cosine_similarity(X_query_tfidf, X_train_tfidf).flatten()
        df['weight'] = cosine_similarities
        df = df.sort_values(by='weight', ascending=False)

        results = df[df['weight'] > 0].to_dict(orient='records')

        if len(results) == 0:
            fuzzy_matches = get_fuzzy_matches(query, df['nama'].tolist())
            if fuzzy_matches:
                suggestion = fuzzy_matches[0][0]

    return results, suggestion


def search_test(data: list, query: str) -> str:
    """
    Debug search – return HTML table dari DataFrame.
    """
    df = pd.DataFrame(data)
    df['stemmed_deskripsi'] = df['deskripsi'].apply(stemmed_words)
    df['stemmed_bahan'] = df['bahan'].apply(stemmed_words)
    df['stemmed_nama'] = df['nama'].apply(stemmed_words)
    df['combined_text'] = (
        df['stemmed_deskripsi'] + ' ' +
        df['stemmed_bahan'] + ' ' +
        df['stemmed_nama']
    )

    count_vect = CountVectorizer()
    X_train_counts = count_vect.fit_transform(df['combined_text'])

    tfidf_transformer = TfidfTransformer()
    X_train_tfidf = tfidf_transformer.fit_transform(X_train_counts)

    if query:
        stemmed_query = [stemmed_words(query)]
        X_query_counts = count_vect.transform(stemmed_query)
        X_query_tfidf = tfidf_transformer.transform(X_query_counts)
        cosine_similarities = cosine_similarity(X_query_tfidf, X_train_tfidf).flatten()
        df['weight'] = cosine_similarities
        df.sort_values(by='weight', ascending=False, inplace=True)

    return df.to_html()
