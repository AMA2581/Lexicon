//
//  DocumentSeprator.swift
//  Lexicon
//
//  Created by Amir Mahdi Abravesh on 5/11/24.
//

import Foundation

class DocumentSeprator {
    var tokenProcessor = TokenProcessor()
    var tokenizer = Tokenizer()

    func seperator(data input: String) -> [[String]] {
        var output: [[String]] = [] // 2D array
        var rawDatas = tokenizer.wordSeperator(input)
        var counter = -1

        for rawData in rawDatas {
            if tokenProcessor.prefixCheck(rawData) {
                if isIndex(rawData) {
                    output.append([])
                    counter += 1
                }
            } else {
                if tokenizer.wordTokenizer(word: rawData) != "" {
                    output[counter].append(tokenizer.wordTokenizer(word: rawData))
                }
            }
        }
        
        return output
    }

    func isIndex(_ input: String) -> Bool {
        if input == ".I" {
            return true
        } else {
            return false
        }
    }
}
