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

class LexiconModel {
    private var fileMgr = FileMgr()
    private var tokenizer = Tokenizer()

    private var fileURL: URL?

    var isRunning = false

    let documentSeperator = DocumentSeprator()
    let termFreq = TermFreq()
    let idfObj = IDF()

    var tfIdf: [String: [DocItem]] = [:]

    func setFile(fileURL: URL) {
        self.fileURL = fileURL
    }

    func setFile(fileString: String) {
        fileURL = URL(string: fileString)
    }

    func isFileUrlNil() -> Bool {
        if fileURL == nil {
            return true
        } else {
            return false
        }
    }

    func getTrainedData() {
        let tdProcessor = TDProcessor()
        let trainedData = fileMgr.readFile(fileURL: fileURL!)

        tfIdf = tdProcessor.TDProcessor(trainedData: trainedData)
    }

    func search(input: String) -> [DocItem] {
        let inputTokens = tokenizer.dataTokenizer(data: input)
        let inputSeperated = documentSeperator.seperator(data: input,
                                                         type: "q")
        let inputMakeDic = MakeDictionary(tokens: inputTokens)
        let inputDic = inputMakeDic.freqDictionary()
        let inputTFIDF = getInputTFIDF(seperatedDoc: inputSeperated,
                                       dictionary: inputDic)
        
        let inputProcessor = InputProcessor()
        let cosine = inputProcessor.getCosine(mainTFIDF: tfIdf, 
                                              inputTFIDF: inputTFIDF)
        
        let sortObj = Sort()
        let sortedCosine = sortObj.mergeSort(list: cosine)
        var output: [DocItem] = []
        
        for item in sortedCosine {
            if item.value == 0.0 {
                break
            } else {
                output.append(item)
            }
        }
        
        return output
    }

    private func getInputTFIDF(seperatedDoc: [[String]],
                               dictionary: [String: Int]) -> [String: [Double]] {
        let inputTermFreq = termFreq.termFrequency(seperatedDocument: seperatedDoc,
                                                   dictionary: dictionary)
        let inputTF = termFreq.calcTF(termFrequency: inputTermFreq)
        let inputDF = idfObj.df(seperatedDocument: seperatedDoc,
                                dictionary: dictionary)
        let inputIDF = idfObj.idf(df: inputDF,
                                  documentCount: seperatedDoc.count)
        let inputTFIDF = idfObj.tfIdf(tf: inputTF,
                                      idf: inputIDF)
        return inputTFIDF
    }
}
