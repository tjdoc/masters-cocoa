//
//  main.swift
//  p8958
//
//  Created by Tae-Jin Oh on 2020/11/06.
//
//  https://www.acmicpc.net/problem/8958
//  OX quiz

import Foundation

func p8958(check:Bool = false) {
    let inputMsg = "Input 8 integer notes separated by spaces. Each notes must be in the range 1 <= n <= 8"
    let invalidMsg = "Error: Invalid input"
    
    if check {
        print(inputMsg)
    }
    let inStr = readLine()!
    
    // check input
    guard inStr.split(separator: " ").count == 8 else {
        print(invalidMsg)
        return p2920()
    }
    let inArr = inStr.split(separator: " ")
    for noteStr in inArr {
        guard Int(noteStr) != nil && Int(noteStr)! >= 1 && Int(noteStr)! <= 8 else {
            print(invalidMsg)
            return p2920()
        }
    }
    
    let ascendingArr = "1 2 3 4 5 6 7 8".split(separator:" ")
    let descendingArr = "8 7 6 5 4 3 2 1".split(separator:" ")
    
    switch inArr {
    case ascendingArr:
        print("ascending")
    case descendingArr:
        print("descening")
    default:
        print("mixed")
    }
}

p8958()
