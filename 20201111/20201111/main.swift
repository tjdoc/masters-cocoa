//
//  main.swift
//  20201111
//
//  Created by Tae-Jin Oh on 2020/11/11.
//

import Foundation

func printPractice(_ practiceStr:String) {
    print()
    print(String(repeating:"=", count:50))
    print("Practice \(practiceStr)")
    print()
}

printPractice("1")

func testInterest(unitday: Int) -> Double {
    let saving = Interest()
    return saving.calculateAmount(day: unitday, amount: 1000000)
}

for day in 1...365 {
    let spaces = String(repeating:" ", count:3-String(day).count)
    print("예치일: \(spaces)\(day) | 이자+원금: \(testInterest(unitday:day)))")
}

print()
print(String(repeating:"-", count:40))

for day in stride(from:10, through: 365, by: 10) {
    let spaces = String(repeating:" ", count:3-String(day).count)
    print("예치일: \(spaces)\(day) | 이자+원금: \(testInterest(unitday:day))")
}

printPractice("2")

var baseBallGame = BaseBall()
var count = 0
var numGameSets = 1
for _ in 0..<numGameSets {
    if baseBallGame.showGameScore() {
        count += 1
    }
}
print("won \(count) times out of \(numGameSets) game sets")
