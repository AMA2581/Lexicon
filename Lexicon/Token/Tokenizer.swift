//
//  Tokenizer.swift
//  Lexicon
//
//  Created by Amir Mahdi Abravesh on 4/24/24.
//

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
