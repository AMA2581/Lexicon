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

    var content: String?
    var stopWord: String?
    var tokens: [Token] = []
    var seperatedDoc: [[String]] = []
    var makeDic: MakeDictionary?
    var dictionary: [String: Int] = [:]
    var tfIdf: [String: [DocItem]] = [:]

    func setFile(fileURL: URL) {
        self.fileURL = fileURL
    }

    func setFile(fileString: String) {
        fileURL = URL(string: fileString)
    }

    func getTrainedData() {
        var tdProcessor = TDProcessor()
        var trainedData = fileMgr.readFile(fileURL: fileURL!)
        
        tfIdf = tdProcessor.TDProcessor(trainedData: trainedData)
    }
}
