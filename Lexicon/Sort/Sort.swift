// Lexicon
// Copyright (C) 2024 Amir Mahdi Abravesh, Mohammad Mehdi Nasrollahi, Mohammad Jamshidi
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

class Sort {
    func merge(left:[DocItem],right:[DocItem]) -> [DocItem] {
        var mergedList: [DocItem] = []
        var left = left
        var right = right
        
        while left.count > 0 && right.count > 0 {
            if left.first!.value > right.first!.value {
                mergedList.append(left.removeFirst())
            } else {
                mergedList.append(right.removeFirst())
            }
        }

        return mergedList + left + right
    }

    func mergeSort(list: [DocItem]) -> [DocItem] {
        guard list.count > 1 else {
            return list
        }
        
        let leftList = Array(list[0..<list.count/2])
        let rightList = Array(list[list.count/2..<list.count])
        
        return merge(left: mergeSort(list:leftList), right: mergeSort(list:rightList))
    }
}
