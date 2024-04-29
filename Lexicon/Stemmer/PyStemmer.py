from nltk.stem import PorterStemmer , SnowballStemmer , WordNetLemmatizer


stemmer = PorterStemmer()
new_stemmer = SnowballStemmer("english")
lem = WordNetLemmatizer()

verbs = ['caresses','mules', 'died', 'flies', 'denied', 'agreed', 'generously', 'caring']

for word in verbs:
    print(f"{word} --> {stemmer.stem(word)}")
print("-----------")
for word in verbs:
    print(f"{word} --> {new_stemmer.stem(word)}")
print('--------')
for word in verbs:
    print(f"{word} --> {lem.lemmatize(word)}")


# def stemmer():

#     pass

