//
//  IDF.swift
//  Lexicon
//
//  Created by Amir Mahdi Abravesh on 5/12/24.
//

import Foundation

class IDF {
    func df(seperatedDocument sepDocs: [[String]],
            dictionary: [String: Int]) -> [String: Int] {
        var output: [String: Int] = [:]
        
        for dic in dictionary {
            var bufferCounter = 0
            for sepDoc in sepDocs {
                for doc in sepDoc {
                    if dic.key == doc {
                        bufferCounter += 1
                        break
                    }
                }
            }
            output[dic.key] = bufferCounter
        }
        
        return output
    }
}
