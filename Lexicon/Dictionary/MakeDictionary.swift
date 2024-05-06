//
//  MakeDictionary.swift
//  Lexicon
//
//  Created by Amir Mahdi Abravesh on 5/6/24.
//

import Foundation

class MakeDictionary {
    var tokens: [Token]
    
    init(tokens: [Token]) {
        self.tokens = tokens
    }
    
    func freqDictionary() -> [String: Int] {
        var dic: [String: Int] = [:]
        var checkedTokens: [String] = []
        
        for (index, token) in tokens.enumerated() {
            // checks if the token is already checked
            if !checkedTokens.contains(token.getToken()){
                var i = index
                var counter = 1
                
                // counts how many of that word exists
                while i < tokens.count {
                    if i != 0 {
                        if token.getToken() == tokens[i].getToken() {
                            counter += 1
                        }
                    }
                    
                    i += 1
                }
                
                // add the token to checked tokens and add to the dictionary
                checkedTokens.append(token.getToken())
                dic[token.getToken()] = counter
            }
        }
        
        return dic
    }
}
