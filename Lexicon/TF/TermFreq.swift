//
//  TermFreq.swift
//  Lexicon
//
//  Created by Amir Mahdi Abravesh on 5/12/24.
//

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
            var tempArr = dic.value
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
