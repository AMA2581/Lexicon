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
            var buffer = rawData
            if tokenProceessor.prefixCheck(buffer) {
                tokenProceessor.typeCheck(buffer)
            } else {
                output.append(tokenProceessor.process(buffer))
            }
        }
        
        return output
    }
    
    private func wordSeperator(_ input: String) -> [String] {
        var buffers = input.components(separatedBy: "\n")
        var out: [String] = []
        
        for buffer in buffers {
            out += buffer.components(separatedBy: " ")
        }
        
        return out
    }
}
