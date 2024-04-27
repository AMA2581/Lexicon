//
//  TokenProcessor.swift
//  Lexicon
//
//  Created by Amir Mahdi Abravesh on 4/24/24.
//

import Foundation

class TokenProcessor {
    var stopWords: [String] = []
    var typeFlag = TokenType.title
    
    func process(_ input: String) -> Token {
        var outstr = ""
        var output: Token
        
        for char in input {
            if char.isASCII {
//                if char.asciiValue! > 65 ||
//                    char.asciiValue! < 90 ||
//                    char.asciiValue! > 97 ||
//                    char.asciiValue! < 122 {
//                    outstr += String(char)
//                }
                switch char.asciiValue! {
                case 65 ... 90:
                    outstr += String(char)
                case 97 ... 122:
                    outstr += String(char)
                default:
                    outstr += ""
                }
            }
        }
        
        output = Token(token: outstr, type: typeFlag)
        
        return output
    }
    
    /// This function is for checking if the token has "." in the beginning
    /// If it has it it's a type not a token
    func prefixCheck(_ input: String) -> Bool {
        let buffer = NSString(string: input)
        return buffer.hasPrefix(".")
    }
    
    func typeCheck(_ input: String) {
        // TODO: add .N .X STOP_WORDS DID QID
        switch input {
        case ".I":
            typeFlag = TokenType.index
        case ".T":
            typeFlag = TokenType.title
        case ".A":
            typeFlag = TokenType.author
        case ".B":
            typeFlag = TokenType.bibliography
        case ".W":
            typeFlag = TokenType.text
        case ".N":
            typeFlag = TokenType.date
        default:
            typeFlag = TokenType.title
        }
    }
}
