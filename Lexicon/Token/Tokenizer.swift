//
//  Tokenizer.swift
//  Lexicon
//
//  Created by Amir Mahdi Abravesh on 4/24/24.
//

import Foundation

class Tokenizer {
    
    func tokenizer(data input: String) -> [Token] {
        var output: [Token] = []
        var rawDatas = input.components(separatedBy: " ")
        
        for rawData in rawDatas {
            output.append(Token(token: rawData, type: TokenType.text))
        }
        
        return output
    }
}
