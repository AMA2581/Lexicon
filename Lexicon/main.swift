//
//  main.swift
//  Lexicon
//
//  Created by Amir Mahdi Abravesh on 4/22/24.
//

import Foundation

var fileReader = FileReader()
var tokenizer = Tokenizer()

let files = fileReader.fileUrlGetter(datasetFolderUrl: URL(string: "/Users/ama25/Documents/Lexicon/Lexicon/cacm/"))
let content = fileReader.readFile(fileURL: files[1])

let stopWord = fileReader.readFile(fileURL: files[2])
tokenizer.setStopWord(string: stopWord)

var tokens = tokenizer.dataTokenizer(data: content)
var stemmer = Stemmer()

var documentSeperator = DocumentSeprator()
var seperatedDoc = documentSeperator.seperator(data: content)

for doc in seperatedDoc {
    print(doc)
}

//for token in tokens {
//    print(token.getToken())
//    print(token.type)
//    print("-------------------------------")
//}

//var makeDic = MakeDictionary(tokens: tokens)
//var dictionary = makeDic.freqDictionary()

//for dic in dictionary {
//    print(dic)
//}
