//
//  File.swift
//  Lexicon
//
//  Created by Amir Mahdi Abravesh on 5/31/24.
//

import Foundation

class CMath {
    
    /// before calling this function make sure you do the padding first
    func dotProduct(mainVector vectorA: [Double], inputVector vectorB: [Double]) -> Double? {
        
        // TODO: add multi value vector for inputVector
        
        // Check if vectors are of the same length
        guard vectorB.count == 1 else {
            print("input vector should have only 1 object")
            return nil
        }
        
        // Calculate the dot product
        var result: Double = 0
        for i in 0..<vectorA.count {
            result += vectorA[i] * vectorB[1]
        }
        
        return result
    }
}
