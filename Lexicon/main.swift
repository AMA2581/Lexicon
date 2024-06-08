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

var fileMgr = FileMgr()
var tokenizer = Tokenizer()

let files = fileMgr.fileUrlGetter(datasetFolderUrl: URL(string: "/Users/ama25/Documents/Side_Projects/Lexicon/Lexicon/cacm/"))
let content = fileMgr.readFile(fileURL: files[1])

let stopWord = fileMgr.readFile(fileURL: files[2])
tokenizer.setStopWord(string: stopWord)

var tokens = tokenizer.dataTokenizer(data: content)
var stemmer = Stemmer()

var documentSeperator = DocumentSeprator()
var seperatedDoc = documentSeperator.seperator(data: content, type: "d")

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
var idf = idfObj.idf(df: df, documentCount: seperatedDoc.count)
var tfIdf = idfObj.tfIdf(tf: tf, idf: idf)

fileMgr.writeTrainedTxtFile(dictionary: tfIdf, url: URL(string: "/Users/ama25/Documents/Side_Projects/Lexicon/Lexicon/trainedData/"))
print("-------------------------------")
print("Done!")

// MARK: Input
//let tempInput = "Numerical Solution of the Polynomial Equation" // .I 44 query
//
//var inputTokens = tokenizer.dataTokenizer(data: tempInput)
//var inputSeperated = documentSeperator.seperator(data: tempInput, type: "q")
//var inputMakeDic = MakeDictionary(tokens: inputTokens)
//var inputDic = inputMakeDic.freqDictionary()
//
//var inputTermFreq = termFreq.termFrequency(seperatedDocument: inputSeperated, dictionary: inputDic)
//var inputTF = termFreq.calcTF(termFrequency: inputTermFreq)
//
//var inputDF = idfObj.df(seperatedDocument: inputSeperated, dictionary: inputDic)
//var inputIDF = idfObj.idf(df: inputDF, documentCount: inputSeperated.count)
//var inputTFIDF = idfObj.tfIdf(tf: inputTF, idf: inputIDF)
//
//var inputProcessor = InputProcessor()
//var cosine = inputProcessor.getCosine(mainTFIDF: tfIdf, inputTFIDF: inputTFIDF)
//
//var sortObj = Sort()
//var sortedCosine = sortObj.mergeSort(list: cosine)
//
//for fre in sortedCosine {
//    print(fre.key)
//    print(fre.value)
////    print(fre)
//    print("-------------------------------")
//}
//print(freq.count)
