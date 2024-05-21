// Lexicon
// Copyright (C) 2024 Amir Mahdi Abravesh, Mohammad Mehdi Nasrollahi
//
// This program is free software; you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation; either version 2 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License along
// with this program;

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

//for doc in seperatedDoc {
//    print(doc)
//}

//for token in tokens {
//    print(token.getToken())
//    print(token.type)
//    print("-------------------------------")
//}

var makeDic = MakeDictionary(tokens: tokens)
var dictionary = makeDic.freqDictionary()

//for dic in dictionary {
//    print(dic)
//}

var termFreq = TermFreq()
var freq = termFreq.termFrequency(seperatedDocument: seperatedDoc, dictionary: dictionary)
var tf = termFreq.calcTF(termFrequency: freq)

var idfObj = IDF()
var df = idfObj.df(seperatedDocument: seperatedDoc, dictionary: dictionary)
var idf = idfObj.idf(df: df)
var tfIdf = idfObj.tfIdf(tf: tf, idf: idf)

for fre in tfIdf {
    print(fre.key)
    print(fre.value)
    print("-------------------------------")
}
//print(freq.count)
