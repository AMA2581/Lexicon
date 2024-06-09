//
//  Sort.swift
//  Lexicon
//
//  Created by Amir Mahdi Abravesh on 6/3/24.
//

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
