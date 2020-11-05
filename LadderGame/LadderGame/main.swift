//
//  main.swift
//  LadderGame
//
//  Created by Tae-Jin Oh on 2020/11/05.
//

import Foundation

enum LadderError: Error {
    case invalidInput
    
}

func inputProcess() throws -> Int {
    
    print("Input the number of players (2-8):", terminator:" ")
    let playerNumStr = readLine()?.trimmingCharacters(in: .whitespacesAndNewlines)
    guard Int(playerNumStr!) != nil else {
        throw LadderError.invalidInput
    }
    let playerNum = Int(playerNumStr!)
    return playerNum!
}

func ladderGame(playerNum: Int) {
    
}
