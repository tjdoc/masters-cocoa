//
//  main.swift
//  20201118
//
//  Created by Tae-Jin Oh on 2020/11/18.
//

import Foundation

func printPractice(_ practiceStr:String, _ major: Bool=true) {
    print()
    let div = major ? "=" : "."
    print(String(repeating: div, count: 50))
    print("Practice \(practiceStr)")
    print()
}

//==================================================
printPractice("1: bracket match")

let round = BracketMatch(with: .round)
let square = BracketMatch(with: .square)
let curly = BracketMatch(with: .curly)

print("with 2 pairs")
var out = round.generate(with:2)
for pair in out {
    print(pair)
}
print("\nwith 3 pairs")
out = square.generate(with:3)
for pair in out {
    print(pair)
}
print()
print(round.analyze(with: "())") == false ? "PASS" : "FAIL")
print(round.analyze(with: "(())") == true ? "PASS" : "FAIL")
print(curly.analyze(with: "{}}") == false ? "PASS" : "FAIL")
print(curly.analyze(with: "{{}}") == true ? "PASS" : "FAIL")

//==================================================
printPractice("Practice 1: floating point addition")
print(mySum(value: 0.001, repeat: 1_000))

//==================================================
var x = 6.5
print("\nx is \(x)")
// Equivalent to the C 'round' function:
// 우선 가까운 정수로. .5일 경우 0에서 멀어지는 쪽으로
print("x.rounded(.toNearestOrAwayFromZero) ", terminator: "")
print(x.rounded(.toNearestOrAwayFromZero))
// Prints "7.0"

// Equivalent to the C 'trunc' function:
// 우선 가까운 정수로. .5일 경우 0으로 가까운 쪽으로
print("x.rounded(.towardZero) ", terminator: "")
print(x.rounded(.towardZero))
// Prints "6.0"

// Equivalent to the C 'ceil' function:
// 올림
print("x.rounded(.up) ", terminator: "")
print(x.rounded(.up))
// Prints "7.0"

// Equivalent to the C 'floor' function:
// 내림
print("x.rounded(.down) ", terminator: "")
print(x.rounded(.down))
// Prints "6.0"

x = 6.4
print("\nx is \(x)")
// Equivalent to the C 'round' function:
// 7보다 6에 더 가까우므로 6으로
print("x.rounded(.toNearestOrAwayFromZero) ", terminator: "")
print(x.rounded(.toNearestOrAwayFromZero))
// Prints "6.0"

x = 6.0
print("\nx is \(x)")

// Equivalent to the C 'ceil' function:
// 6.0은 올려도 6
print("x.rounded(.up) ", terminator: "")
print(x.rounded(.up))
// Prints "6.0"

let aa = Array("this is an array")
print(aa.map{String($0)}.joined(separator:" "))
