//
//  randModel.swift
//  Bingo
//
//  Created by Tae-Jin Oh on 2020/11/28.
//

import Foundation

struct randModel {
    var numList = [Int]()
    var numListStr = ""
    var availableList = [Int]()
    var currentNum = 0
    let lowerLimit = 1
    let upperLimit = 75
    init() {
        reset()
    }
    mutating func reset() {
        numList = []
        numListStr = ""
        availableList = Array(lowerLimit...upperLimit).shuffled()
        currentNum = 0
    }
    mutating func genRand() {
        if availableList.count > 0 {
            currentNum = availableList.popLast()!
            numList.append(currentNum)
            numList.sort()
            numListStr = numList.map{String($0)}.joined(separator: " ")
        }
    }
}
