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

class CMath {
    
    /// before calling this function make sure you do the padding first
    func dotProduct(mainVector vectorA: [Double], inputVector vectorB: [Double]) -> [Double]? {
        
        // TODO: add multi value vector for inputVector
        
        // Check if vectors are of the same length
        guard vectorB.count == 1 else {
            print("input vector should have only 1 object")
            return nil
        }
        
        // Calculate the dot product
        var result: [Double] = []
        for i in 0..<vectorA.count {
            result.append(vectorA[i] * vectorB[1])
        }
        
        return result
    }
    
    
}
