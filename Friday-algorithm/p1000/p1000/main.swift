//
//  main.swift
//  p1000
//
//  Created by Tae-Jin Oh on 2020/11/06.
//

import Foundation

// https://www.acmicpc.net/problem/1000

func p1000(msg:Bool = false) {
    if msg {print("Input two positive integers less than 10, separated with a space")}
    let inStr = readLine()!
    if msg {
        guard inStr.contains(" ") && inStr.split(separator:" ").count == 2 else {
            print("Error, must input two positive integers less than 10, separated by a space")
            return p1000()
        }
    }
    
    var out = 0
    
    for ii in inStr.split(separator: " ") {
        if msg {
            guard Int(ii) != nil && Int(ii)! > 0 && Int(ii)! < 10 else {
                print("Error, must input two positive integers less than 10, separated by a space")
                return p1000()
            }
        }
        out += Int(ii)!
    }
    print(out)
}

p1000()
