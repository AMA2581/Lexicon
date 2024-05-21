// Lexicon
// Copyright (C) 2024 Amir Mahdi Abravesh, Mohammad Mehdi Nasrollahi
//
// This program is free software; you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation; either version 2 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License along
// with this program;

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
        self.type = TokenType.title
    }
    
    /// For updating token. Be cautious with it.
    mutating func updateToken(_ input: String) {
        self.token = input
    }
    
    /// For getting the token
    func getToken() -> String {
        return token
    }
}
