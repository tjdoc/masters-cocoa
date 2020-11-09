//
//  problem_2.swift
//  20201109
//
//  Created by Tae-Jin Oh on 2020/11/09.
//

import Foundation

// practice 2

func checkLength(password: String) -> Bool {
    return password.count < 5 || password.count >= 24 ? false : true
}

func checkChar(password: String) -> Bool {
    let wrongChars = password.replacingOccurrences(of: "[a-zA-Z0-9-]", with:"",
                                              options: .regularExpression)
    return wrongChars.count == 0 ? true : false
}

func checkNum(password: String) -> Bool {
    let range = NSRange(location: 0, length: password.utf16.count)
    let regex = try! NSRegularExpression(pattern: "[0-9]{3,}")
    for match in regex.matches(in: password, options: [], range: range) {
        let numStr = String(password[Range(match.range, in:password)!])
        for ii in 0...9 {
            // [recurring number], [consecutive number]
            let checkPatterns = ["\(ii)\(ii)\(ii)", "\(ii)\(ii+1)\(ii+2)"]
            for checkPattern in checkPatterns {
                if numStr.contains(checkPattern) {
                    return false
                }
            }
        }
    }
    return true
}

func IDValidator(password: String) -> Bool {
    return (checkLength(password: password) &&
                checkChar(password: password) &&
                checkNum(password: password)) ? true : false
}
