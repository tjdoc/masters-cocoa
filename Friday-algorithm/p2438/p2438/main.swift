//
//  main.swift
//  p2438
//
//  Created by Tae-Jin Oh on 2020/11/06.
//

import Foundation

// https://www.acmicpc.net/problem/2438
// printing stars

func p2438() {
    print("Input an integer N within 1 <= N <= 100")
    let inStr = readLine()!
    guard 1 <= Int(inStr)! && Int(inStr)! <= 100 else {
        print("Error, must input an integer N within 1 <= N <= 100")
        return p2438()
    }
    let lines = Int(inStr)!
    for line in 1...lines {
        print(String(repeating:"*", count:line))
    }
}

p2438()
