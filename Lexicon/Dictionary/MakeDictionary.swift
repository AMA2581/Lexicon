// Lexicon
// Copyright (C) 2024 Amir Mahdi Abravesh, Mohammad Mehdi Nasrollahi, Mohammad Jamshidi
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
            if !checkedTokens.contains(token.getToken()) {
                var i = index
                var counter = 0

                // counts how many of that word exists
                while i < tokens.count {
                    if token.getToken() == tokens[i].getToken() {
                        counter += 1
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
