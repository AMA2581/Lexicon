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
        let rawDatas = input.components(separatedBy: " ")
        
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
}
