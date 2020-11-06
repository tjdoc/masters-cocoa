//
//  p2438.swift
//  algorithm_main
//
//  Created by Tae-Jin Oh on 2020/11/06.
//
//  https://www.acmicpc.net/problem/2438
//  별찍기

import Foundation

func p2438(check:Bool = false) {
    if check {
        print("Input number of lines (1 <= N <= 100)")
    }
    let linesStr = readLine()!
    if check {
        guard Int(linesStr) != nil && Int(linesStr)! >= 1 && Int(linesStr)! <= 100 else {
            print("Invalid input")
            return p2438()
        }
    }
    let lines = Int(linesStr)!
    for line in 1...lines {
        print(String(repeating: "*", count: line))
    }
}
