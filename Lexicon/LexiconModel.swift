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
    private var fileReader = FileReader()
    private var tokenizer = Tokenizer()

    private var fileURL: URL?
    private var stopWordURL: URL?

    var isRunning = false

    let documentSeperator = DocumentSeprator()
    let termFreq = TermFreq()
    let idfObj = IDF()

    var content: String?
    var stopWord: String?
    var tokens: [Token] = []
    var seperatedDoc: [[String]] = []
    var makeDic: MakeDictionary?
    var dictionary: [String: Int] = [:]
    var tf: [String: [Double]] = [:]
    var idf: [String: Double] = [:]
    var tfIdf: [String: [Double]] = [:]

    func setFile(fileURL: URL) {
        self.fileURL = fileURL
    }

    func setFile(fileString: String) {
        fileURL = URL(string: fileString)
    }

    func setStopWordFile(fileURL: URL) {
        stopWordURL = fileURL
    }

    func setStopWordFile(fileString: String) {
        stopWordURL = URL(string: fileString)
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

    /// fetches content file and puts it inside content
    func fetchContent() {
        if let URL = fileURL {
            content = fileReader.readFile(fileURL: URL)
        }
    }

    /// fetches stopword file and puts it inside stopWord
    func fetchSW() {
        if let URL = stopWordURL {
            stopWord = fileReader.readFile(fileURL: URL)
            tokenizer.setStopWord(string: stopWord!)
        }
    }

    /// fetches Tokens and seperatesDocs
    func fetchTokens() {
        if let safeContent = content {
            tokens = tokenizer.dataTokenizer(data: safeContent)
            seperatedDoc = documentSeperator.seperator(data: safeContent)
        }
    }

    func fetchDictionary() {
        makeDic = MakeDictionary(tokens: tokens)
        dictionary = makeDic!.freqDictionary()
    }

    func fetchTF() {
        let freq = termFreq.termFrequency(seperatedDocument: seperatedDoc, dictionary: dictionary)
        tf = termFreq.calcTF(termFrequency: freq)
    }

    func fetchIDF() {
        let df = idfObj.df(seperatedDocument: seperatedDoc, dictionary: dictionary)
        idf = idfObj.idf(df: df, documentCount: seperatedDoc.count)
    }

    func fetchTFIDF() {
        if !tf.isEmpty && !idf.isEmpty {
            tfIdf = idfObj.tfIdf(tf: tf, idf: idf)
        }
    }

    func start() {
        let documentSeperator = DocumentSeprator()
        let termFreq = TermFreq()
        let idfObj = IDF()

        var content: String?
        var stopWord: String?
        var tokens: [Token] = []
        var seperatedDoc: [[String]] = []
        isRunning = true

        DispatchQueue.global().async {
            if let URL = self.fileURL {
                content = self.fileReader.readFile(fileURL: URL)
            }

            if let URL = self.stopWordURL {
                stopWord = self.fileReader.readFile(fileURL: URL)
                self.tokenizer.setStopWord(string: stopWord!)
            }
        }

        // DO NOT MAKE THIS CONCURRENT
        // IT WILL RUIN THE PYTHONKIT AND IT
        // WON'T WORK
        if let safeContent = content {
            tokens = tokenizer.dataTokenizer(data: safeContent)
            seperatedDoc = documentSeperator.seperator(data: safeContent)
        }

        DispatchQueue.global().async {
            let makeDic = MakeDictionary(tokens: tokens)
            let dictionary = makeDic.freqDictionary()

            let freq = termFreq.termFrequency(seperatedDocument: seperatedDoc, dictionary: dictionary)
            self.tf = termFreq.calcTF(termFrequency: freq)
            let df = idfObj.df(seperatedDocument: seperatedDoc, dictionary: dictionary)
            self.idf = idfObj.idf(df: df, documentCount: seperatedDoc.count)
            self.tfIdf = idfObj.tfIdf(tf: self.tf, idf: self.idf)
            self.isRunning = false
        }
    }
}
