//
//  Token.swift
//  Lexicon
//
//  Created by Amir Mahdi Abravesh on 4/23/24.
//

import Foundation

struct Token {
    private var token: String
    let type: TokenType
    
    init(token: String, type: TokenType) {
        self.token = token
        self.type = type
    }
    
    init() {
        self.token = ""
        self.type = TokenType.text
    }
    
    /// For getting the token
    func getToken() -> String {
        return token
    }
}
