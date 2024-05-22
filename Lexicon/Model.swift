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

class Model {
    private var fileReader = FileReader()
    private var tokenizer = Tokenizer()
    
    private var fileURL: URL?
    private var stopWordURL: URL?
    
    func setFile(fileURL: URL) {
        self.fileURL = fileURL
    }
    
    func setFile(fileString: String) {
        self.fileURL = URL(string: fileString)
    }
    
    func setStopWordFile(fileURL: URL) {
        self.stopWordURL = fileURL
    }
    
    func setStopWordFile(fileString: String) {
        self.stopWordURL = URL(string: fileString)
    }
    
    func isFileNil() -> Bool {
        if fileURL == nil {
            return true
        } else {
            return false
        }
    }
    
    func isSWNil() -> Bool {
        if stopWordURL == nil {
            return true
        } else {
            return false
        }
    }
    
    func start() -> [String: Int] {
        var documentSeperator = DocumentSeprator()
        var termFreq = TermFreq()
        var idfObj = IDF()
        
        var content: String?
        var stopWord: String?
        var tokens: [Token] = []
        var seperatedDoc: [[String]] = []
        
        if let URL = fileURL {
            content = fileReader.readFile(fileURL: URL)
        }
        
        if let URL = stopWordURL {
            stopWord = fileReader.readFile(fileURL: URL)
            tokenizer.setStopWord(string: stopWord!)
        }
        
        if let safeContent = content {
            tokens = tokenizer.dataTokenizer(data: safeContent)
            seperatedDoc = documentSeperator.seperator(data: safeContent)
        }
        
        
        var makeDic = MakeDictionary(tokens: tokens)
        var dictionary = makeDic.freqDictionary()
        
        var freq = termFreq.termFrequency(seperatedDocument: seperatedDoc, dictionary: dictionary)
        var tf = termFreq.calcTF(termFrequency: freq)

        var df = idfObj.df(seperatedDocument: seperatedDoc, dictionary: dictionary)
        var idf = idfObj.idf(df: df)
        var tfIdf = idfObj.tfIdf(tf: tf, idf: idf)
        
        return dictionary
    }
}
