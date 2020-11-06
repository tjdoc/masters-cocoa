//
//  main.swift
//  p1008
//
//  Created by Tae-Jin Oh on 2020/11/06.
//

import Foundation

// https://www.acmicpc.net/problem/1008
// A/B

func p1008() {
    print("Input two positive integers less than 10, separated with a space")
    let inStr = readLine()!
    guard inStr.contains(" ") && inStr.split(separator:" ").count == 2 else {
        print("Error, must input two positive integers less than 10, separated by a space")
        return p1008()
    }
    let numArr = inStr.split(separator:" ")
    for ii in 0...1 {
        guard Int(numArr[ii]) != nil && Int(numArr[ii])! > 0 && Int(numArr[ii])! < 10 else {
            print("Error, must input two positive integers less than 10, separated by a space")
            return p1008()
        }
    }
    print(Double(numArr[0])!/Double(numArr[1])!)
}

p1008()
