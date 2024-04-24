//
//  TokenProcessor.swift
//  Lexicon
//
//  Created by Amir Mahdi Abravesh on 4/24/24.
//

import Foundation

class TokenProcessor {
    // TODO: use NSString.hasPrefix(".") to get the token type
    
    /// This function is for checking if the token has "." in the beginning
    /// If it has it it's a type not a token
    func prefixCheck(_ input: String) -> Bool {
        var buffer = NSString(string: input)
        return buffer.hasPrefix(".")
    }
    
    func typeCheck() {
        
    }
}
