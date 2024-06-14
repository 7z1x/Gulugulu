import pandas as pd
from sklearn.feature_extraction.text import CountVectorizer, TfidfTransformer
import numpy as np
import nltk
from nltk.stem import PorterStemmer
from nltk.corpus import stopwords
from sklearn.metrics.pairwise import cosine_similarity

nltk.download('punkt')
nltk.download('stopwords')

# Define a custom tokenizer that stems words and removes stopwords
stemmer = PorterStemmer()
stop_words = set(stopwords.words('english'))

def stemmed_words(doc):
    return ' '.join([stemmer.stem(word) for word in nltk.word_tokenize(doc) if word.lower() not in stop_words])

# Prepare the food data
food_data = [
    {"name": "Pizza", "deskripsi": "A delicious pizza with cheese and tomato sauce."},
    {"name": "Sushi", "deskripsi": "A traditional Japanese dish with rice and raw fish."},
    {"name": "Burger", "deskripsi": "A classic burger with beef patty, lettuce, and tomato."},
    {"name": "Pasta", "deskripsi": "Italian pasta with a rich tomato and basil sauce."},
    {"name": "Salad", "deskripsi": "A healthy salad with fresh vegetables and a light dressing."},
    {"name": "Tacos", "deskripsi": "Mexican tacos with meat, cheese, and salsa."},
    {"name": "Ice Cream", "deskripsi": "A sweet dessert made from frozen cream and sugar."},
    {"name": "Steak", "deskripsi": "A juicy steak grilled to perfection."},
    {"name": "Soup", "deskripsi": "A warm soup with vegetables and chicken."},
    {"name": "Sandwich", "deskripsi": "A sandwich with ham, cheese, and lettuce."}
]

# Convert the food data into a DataFrame
df = pd.DataFrame(food_data)

# Apply stemming to the descriptions
df['stemmed_deskripsi'] = df['deskripsi'].apply(stemmed_words)

# Split the data into stemmed descriptions and names
X = df['stemmed_deskripsi']
y = df['name']

# Create a CountVectorizer
count_vect = CountVectorizer()
X_train_counts = count_vect.fit_transform(X)

# Transform the counts to TF-IDF representation
tfidf_transformer = TfidfTransformer()
X_train_tfidf = tfidf_transformer.fit_transform(X_train_counts)

# Preprocess and transform the query
query = ["cheese"]
stemmed_query = [stemmed_words(query[0])]
X_query_counts = count_vect.transform(stemmed_query)
X_query_tfidf = tfidf_transformer.transform(X_query_counts)

# Calculate cosine similarity between the query and each document in the dataset
cosine_similarities = cosine_similarity(X_query_tfidf, X_train_tfidf).flatten()

# Add the similarity scores (weights) to the DataFrame
df['weight'] = cosine_similarities

# Print the DataFrame
print(df[['name', 'deskripsi', 'stemmed_deskripsi','weight']])
