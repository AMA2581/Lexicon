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

class Tokenizer {
    var tokenProceessor = TokenProcessor()
    var stemmer = Stemmer()

    func dataTokenizer(data input: String) -> [Token] {
        var output: [Token] = []
        let rawDatas = wordSeperator(input)

        for rawData in rawDatas {
            if tokenProceessor.prefixCheck(rawData) {
                tokenProceessor.typeCheck(rawData)
            } else {
                if tokenProceessor.strProcessor(rawData) != "" {
                    var buffer = tokenProceessor.strProcessor(rawData)
                    // TODO: add support for other types currently it's processing only title and text
                    if tokenProceessor.typeFlag == TokenType.text ||
                        tokenProceessor.typeFlag == TokenType.title {
                        if !tokenProceessor.isStopword(string: buffer) {
                            buffer = stemmer.stemmer(buffer)
                            output.append(tokenProceessor.process(buffer))
                        }
                    }
                }
            }
        }

        return output
    }

    func wordTokenizer(word input: String) -> String {
        var output = ""
        
        if tokenProceessor.prefixCheck(input) {
            tokenProceessor.typeCheck(input)
        } else {
            if tokenProceessor.strProcessor(input) != "" {
                var buffer = tokenProceessor.strProcessor(input)
                // TODO: add support for other types currently it's processing only title and text
                if tokenProceessor.typeFlag == TokenType.text ||
                    tokenProceessor.typeFlag == TokenType.title {
                    if !tokenProceessor.isStopword(string: buffer) {
                        // TODO: fix this
                        buffer = stemmer.stemmer(buffer)
                        output = buffer
                    }
                }
            }
        }
        
        return output
    }

    func wordSeperator(_ input: String) -> [String] {
        let buffers = input.components(separatedBy: "\n")
        var out: [String] = []

        for buffer in buffers {
            out += buffer.components(separatedBy: " ")
        }

        return out
    }

    func setStopWord(string input: String) {
        tokenProceessor.stopWords = input.components(separatedBy: "\n")
    }
}
