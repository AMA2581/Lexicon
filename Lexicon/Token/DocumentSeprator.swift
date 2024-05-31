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

class DocumentSeprator {
    var tokenProcessor = TokenProcessor()
    var tokenizer = Tokenizer()

    func seperator(data input: String, type: Character) -> [[String]] {
        var output: [[String]] = [] // 2D array
        var rawDatas = tokenizer.wordSeperator(input)
        var counter = -1

        if type == "d" {
            for rawData in rawDatas {
                if tokenProcessor.prefixCheck(rawData) {
                    if isIndex(rawData) {
                        output.append([])
                        counter += 1
                    }
                } else {
                    if tokenizer.wordTokenizer(word: rawData) != "" {
                        output[counter].append(tokenizer.wordTokenizer(word: rawData))
                    }
                }
            }
        } else if type == "q" {
            output.append([])
            counter += 1
            for rawData in rawDatas {
                output[counter].append(tokenizer.wordTokenizer(word: rawData))
            }
        }

        return output
    }

    func isIndex(_ input: String) -> Bool {
        if input == ".I" {
            return true
        } else {
            return false
        }
    }
}
