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
    
    func idf(df datas: [String: Int]) -> [String: Double] {
        var output: [String: Double] = [:]
        let n = datas.count
        
        for data in datas {
            output[data.key] = log10(Double(n)/Double(data.value)) // log10(n/df)
        }
        
        return output
    }
    
    func tfIdf(tf tfs: [String: [Double]],
               idf idfs: [String: Double]) -> [String: [Double]] {
        var output: [String: [Double]] = [:]
        
        for idf in idfs {
            for tf in tfs {
                if idf.key == tf.key {
                    var buffer: [Double] = []
                    for value in tf.value {
                        buffer.append((idf.value * value))
                    }
                    output[tf.key] = buffer
                }
            }
        }
        
        return output
    }
}
