//
//  p11654.swift
//  algorithm_main
//
//  Created by Tae-Jin Oh on 2020/11/06.
//
//  https://www.acmicpc.net/problem/11654
//  ascii code

import Foundation

func p11654() {
    let inStr = readLine()!
    let s = inStr.unicodeScalars
    print(Int(s[s.startIndex].value))
}
