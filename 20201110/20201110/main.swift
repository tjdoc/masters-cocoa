//
//  main.swift
//  20201110
//
//  Created by Tae-Jin Oh on 2020/11/10.
//

import Foundation

enum ASCIIControlCharacter: Character {
    case tab = "\t"
    case lineFeed = "\n"
    case carriageReturn = "\r"
}
var aa = ASCIIControlCharacter.tab.rawValue
print("-----\(aa)-----")
// prints "-----    -----"
