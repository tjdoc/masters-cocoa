//
//  practice_code.swift
//  20201118
//
//  Created by Tae-Jin Oh on 2020/11/18.
//

import Foundation

func mySum(value: Double, repeat: Int) -> Double {
    var sum : Double = 0
    for _ in 1...`repeat` {
        sum += value
    }
    return sum
}
