from nltk.stem import PorterStemmer, SnowballStemmer

def stemmer(str):
    sbs = SnowballStemmer("english")
    return sbs.stem(str)
