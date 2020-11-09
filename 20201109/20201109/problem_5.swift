//
//  problem_5.swift
//  20201109
//
//  Created by Tae-Jin Oh on 2020/11/09.
//

import Foundation

func antFunction(inputArray:[Int]) -> [Int] {
    var current = inputArray[0]
    var count = 0
    var out = [Int]()
    for val in inputArray {
        if val == current {
            count += 1
        } else {
            out.append(current)
            out.append(count)
            count = 1
            current = val
        }
    }
    out.append(current)
    out.append(count)
    return out
}
