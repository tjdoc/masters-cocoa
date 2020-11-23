//
//  main.swift
//  playground
//
//  Created by Tae-Jin Oh on 2020/11/20.
//

import Foundation
import Algorithms

let numbers = [10, 20, 30, 40, 50]
var matchingIndices: Set<Int> = []
for (i, n) in numbers.enumerated() {
    if n.isMultiple(of: 20) {
        matchingIndices.insert(i)
    }
}
print(matchingIndices)
