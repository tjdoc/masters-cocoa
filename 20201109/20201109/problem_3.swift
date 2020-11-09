//
//  problem_3.swift
//  20201109
//
//  Created by Tae-Jin Oh on 2020/11/09.
//

import Foundation

func passwordValidator(password: String) -> Int {
    //  levelCheck = [longpass, hasNum, hasAlpha, hasSpecial]
    var levelCheck = [false, false, false, false]
    
    // check password length
    if password.count >= 8 {
        levelCheck[0] = true
    }
    let range = NSRange(location: 0, length: password.utf16.count)
    
    // check if password contains number or alphabet
    let patternList = ["[0-9]", "[a-zA-Z]"]
    for (ii, pattern) in patternList.enumerated() {
        let regex = try! NSRegularExpression(pattern: pattern)
        if regex.firstMatch(in: password, options: [], range: range) != nil {
            levelCheck[ii+1] = true
        }
    }
    
    // check if password contains special character
    let alnumRemovedCount = password.replacingOccurrences(of: "[a-zA-Z0-9]", with:"",
                                                          options: .regularExpression).count
    levelCheck[3] = alnumRemovedCount > 0 ? true : false
    
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
