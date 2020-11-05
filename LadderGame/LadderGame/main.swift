//
//  main.swift
//  LadderGame
//
//  Created by Tae-Jin Oh on 2020/11/05.
//

import Foundation

func inputProcess() -> Int {
    
    print("Input the number of players (2-8):", terminator:" ")
    // throw로 처리하고 싶었으나 도저히 못하겠음
    let playerNumStr = (readLine() ?? "0").trimmingCharacters(in: .whitespacesAndNewlines)
    guard (Int(playerNumStr) ?? 0) >= 2 && (Int(playerNumStr) ?? 0) <= 8 else {
        return 0
    }
    let playerNum = Int(playerNumStr) ?? 0
    return playerNum
}

func printLadder(playerNum: Int, ladderHeight: Int) {
    guard playerNum != 0 else {
        print("Error: Invalid number of players. Please input numbers between 2-8.")
        return
    }
    guard ladderHeight > 0 else {
        print("Error: Ladder height must be positive.")
        return
    }
    
    for _ in 1...ladderHeight {
        print()
        for _ in 0..<playerNum {
            let ladder = Int.random(in:0...1)%2 == 0 ? "-" : " "
            print("|\(ladder)", terminator:"")
        }
        print("|", terminator:"")
    }
    print()
}

let playerNum = inputProcess()
printLadder(playerNum: playerNum, ladderHeight: 4)
