//
//  Token.swift
//  Lexicon
//
//  Created by Amir Mahdi Abravesh on 4/23/24.
//

import Foundation

struct Token {
    private var token: String
    
    init(token: String) {
        self.token = token
    }
    
    init() {
        self.token = ""
    }
    
    /// For getting the token
    func getToken() -> String {
        return token
    }
}
