//
//  Token.swift
//  Lexicon
//
//  Created by Amir Mahdi Abravesh on 4/23/24.
//

import Foundation

class Token {
    private var token: String
    
    init(token: String) {
        self.token = token
    }
    
    init() {
        self.token = ""
    }
    
    /// For setting or overwriting the token
    func setToken(_ input: String) {
        self.token = input
    }
    
    /// For getting the token
    func getToken() -> String {
        return token
    }
}
