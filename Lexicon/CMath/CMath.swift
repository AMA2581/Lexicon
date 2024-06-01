//
//  File.swift
//  Lexicon
//
//  Created by Amir Mahdi Abravesh on 5/31/24.
//

import Foundation

class CMath {
    
    /// before calling this function make sure you do the padding first
    func dotProduct(_ vectorA: [Double], _ vectorB: [Double]) -> Double? {
        
        // Check if vectors are of the same length
        guard vectorA.count == vectorB.count else {
            print("Vectors must be of the same length")
            return nil
        }
        
        // Calculate the dot product
        var result: Double = 0
        for i in 0..<vectorA.count {
            result += vectorA[i] * vectorB[i]
        }
        
        return result
    }
}
