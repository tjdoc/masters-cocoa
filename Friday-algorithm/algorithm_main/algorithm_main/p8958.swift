//
//  p8958.swift
//  algorithm_main
//
//  Created by Tae-Jin Oh on 2020/11/06.
//
//  https://www.acmicpc.net/problem/8958
//  OX quiz

import Foundation

func score(testStr:String) -> Int {
    var total = 0
    var streak = 0
    for ox in testStr {
        if ox == "O" {
            streak += 1
            total += streak
        } else {
            streak = 0
        }
    }
    return total
}

func p8958(check:Bool = false) {
    if check {
        print("Input number of test cases")
    }
    let numTest = Int(readLine()!)!
    for _ in 0..<numTest {
        print(score(testStr: readLine()!))
    }
}
