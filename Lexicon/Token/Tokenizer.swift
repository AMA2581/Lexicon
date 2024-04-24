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
        var rawDatas = input.components(separatedBy: " ")
        
        for rawData in rawDatas {
            var buffer = rawData
            bufferT = tokenProceessor.process(buffer)
            output.append(bufferT)
        }
        
        return output
    }
}
