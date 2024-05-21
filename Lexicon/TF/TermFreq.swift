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

class TermFreq {
    func termFrequency(seperatedDocument sepDocs: [[String]], 
                       dictionary: [String: Int]) -> [String: [Int]] {
        var output: [String: [Int]] = [:]
        
        for dic in dictionary {
            var bufferCounter: [Int] = []
            for sepDoc in sepDocs {
                var freq = 0
                for doc in sepDoc {
                    if dic.key == doc {
                        freq += 1
                    }
                }
                bufferCounter.append(freq)
            }
            output[dic.key] = bufferCounter
        }
        
        return output
    }
    
    func calcTF(termFrequency input: [String: [Int]]) -> [String: [Double]] {
        var output: [String: [Double]] = [:]
        
        for dic in input {
            let tempArr = dic.value
            var bufferArr: [Double] = []
            for temp in tempArr {
                var buffer: Double = 0.0
                if temp > 0 {
                    buffer = 1.0 + log10(Double(temp))
                } else {
                    buffer = 0
                }
                bufferArr.append(buffer)
            }
            output[dic.key] = bufferArr
        }
        
        return output
    }
}
