//
//  Tokenizer.swift
//  Lexicon
//
//  Created by Amir Mahdi Abravesh on 4/24/24.
//

import Foundation

class Tokenizer {
    var tokenProceessor = TokenProcessor()
    
    func tokenizer(data input: String) -> [Token] {
        var output: [Token] = []
        let rawDatas = wordSeperator(input)
        
        for rawData in rawDatas {
            if tokenProceessor.prefixCheck(rawData) {
                tokenProceessor.typeCheck(rawData)
            } else {
                output.append(tokenProceessor.process(rawData))
            }
        }
        
        return output
    }
    
    private func wordSeperator(_ input: String) -> [String] {
        let buffers = input.components(separatedBy: "\n")
        var out: [String] = []
        
        for buffer in buffers {
            out += buffer.components(separatedBy: " ")
        }
        
        return out
    }
    
    func setStopWord(string input: String) {
        tokenProceessor.stopWords = input.components(separatedBy: "\n")
    }
}
