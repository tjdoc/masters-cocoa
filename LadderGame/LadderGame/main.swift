//
//  main.swift
//  LadderGame
//
//  Created by Tae-Jin Oh on 2020/11/05.
//

import Foundation

func inputProcess() -> Int {
    
    print("Input the number of players (2-8):", terminator:" ")
    let playerNumStr = (readLine() ?? "0").trimmingCharacters(in: .whitespacesAndNewlines)
    guard (Int(playerNumStr) ?? 0) >= 2 && (Int(playerNumStr) ?? 0) <= 8 else {
        return 0
    }
    let playerNum = Int(playerNumStr) ?? 0
    return playerNum
}

func printLadder(playerNum: Int, ladderHeight: Int) {
    guard playerNum != 0 else {
        print("Invalid number of players input. Please use numbers between 2-8")
        return
    }
    guard ladderHeight > 0 else {
        print("Ladder height must be positive")
        return
    }
    print("So far so good!")
}

func main() {
    
    let playerNum = inputProcess()
    let ladderHeight = 4
    printLadder(playerNum: playerNum, ladderHeight: ladderHeight)

}

main()
