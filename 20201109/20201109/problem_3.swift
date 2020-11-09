//
//  problem_3.swift
//  20201109
//
//  Created by Tae-Jin Oh on 2020/11/09.
//

import Foundation

func passwordValidator(password: String) -> Int {
    var levelCheck = [false, // password long enough
                      false, // contains number
                      false, // contains alphabet
                      false] // contains special character
    
    // check password length
    if password.count >= 8 {
        levelCheck[0] = true
    }
    let range = NSRange(location: 0, length: password.utf16.count)
    
    // check if password contains number, alphabet, or other characters
    let patternList = ["[0-9]", "[a-zA-Z]", "[^a-zA-Z0-9]"]
    for (ii, pattern) in patternList.enumerated() {
        let regex = try! NSRegularExpression(pattern: pattern)
        if regex.firstMatch(in: password, options: [], range: range) != nil {
            levelCheck[ii+1] = true
        }
    }
    
    switch levelCheck {
    case [false, true, false, false]:
        return 1
    case [false, false, true, false]:
        return 2
    case [true, true, true, false]:
        return 4
    case [true, true, true, true]:
        return 5
    default:
        return 3
    }
}
