//
//  TokenProcessor.swift
//  Lexicon
//
//  Created by Amir Mahdi Abravesh on 4/24/24.
//

import Foundation

class TokenProcessor {
    
    func process(_ input: String) -> Token {
        var output: Token
        
        return output
    }
    
    /// This function is for checking if the token has "." in the beginning
    /// If it has it it's a type not a token
    func prefixCheck(_ input: String) -> Bool {
        var buffer = NSString(string: input)
        return buffer.hasPrefix(".")
    }
    
    func typeCheck(_ input: String) -> TokenType {
        // TODO: add .B .A .N .W .X STOP_WORDS DID QID
        switch input {
        case "I":
            return TokenType.index
        case "T":
            return TokenType.text
        case "A":
            return TokenType.author
        default:
            return TokenType.text
        }
    }
}
