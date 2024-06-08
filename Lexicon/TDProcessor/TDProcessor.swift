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

class TDProcessor {
    var tokenizer = Tokenizer() // just to use the same word seperator logic
    var typeFlag = TDType.term
    var isDocNum = true
    
    func TDProcessor(trainedData input: String) -> [String: [DocItem]] {
        var output: [String: [DocItem]] = [:]
        var seperatedTDs = tokenizer.wordSeperator(input)
        var bufferTerm = ""
        var bufferDocNum = 0
        var bufferDocRes = 0.0
        var bufferDocItem: [DocItem] = []
        
        
        for td in seperatedTDs {
            if td != "" {
                if tokenizer.tokenProceessor.prefixCheck(td) {
                    typeCheck(td)
                } else if typeFlag == .term {
                    if !bufferDocItem.isEmpty {
                        output[bufferTerm] = bufferDocItem
                        bufferDocItem = []
                    }
                    bufferTerm = td
                } else if typeFlag == .document {
                    if td == "=" {
                        isDocNum = false
                    } else if isDocNum {
                        bufferDocNum = Int(td)!
                    } else if !isDocNum {
                        bufferDocRes = Double(td)!
                        bufferDocItem.append(DocItem(key: bufferDocNum,
                                                     value: bufferDocRes))
                        isDocNum = true
                    }
                }
            }
        }
        
        return output
    }
    
    func typeCheck(_ input: String) {
        switch input {
        case ".T":
            typeFlag = TDType.term
        case ".D":
            typeFlag = TDType.document
        default:
            typeFlag = TDType.term
        }
    }
    
}
