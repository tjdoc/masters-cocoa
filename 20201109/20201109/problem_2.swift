//
//  problem_2.swift
//  20201109
//
//  Created by Tae-Jin Oh on 2020/11/09.
//

import Foundation

// practice 2

func IDValidator(password: String) -> Bool {
    // check length
    let checkLength = password.count < 5 || password.count >= 24 ? false : true
    guard checkLength else {
        return false
    }

    // check if password contains invalid characters
    let range = NSRange(location: 0, length: password.utf16.count)
    var regex = try! NSRegularExpression(pattern: "[^a-zA-Z0-9-]")
    let checkChar = (regex.firstMatch(in: password, options: [], range: range) != nil) ? false : true
    guard checkChar else {
        return false
    }
    
    // check recurring or consecutive number occurrence
    regex = try! NSRegularExpression(pattern: "[0-9]{3,}")
    for match in regex.matches(in: password, options: [], range: range) {
        let numStr = String(password[Range(match.range, in:password)!])
        for ii in 0...9 {
            let checkPatterns = ["\(ii)\(ii)\(ii)",      // recurring number
                                 "\(ii)\((ii+1)%10)\((ii+2)%10)"]  // consecutive number
            for checkPattern in checkPatterns {
                if numStr.contains(checkPattern) {
                    return false
                }
            }
        }
    }
    return true
}
