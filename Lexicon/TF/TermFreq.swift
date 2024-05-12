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
}
