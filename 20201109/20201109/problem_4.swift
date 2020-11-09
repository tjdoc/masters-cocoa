//
//  problem_4.swift
//  20201109
//
//  Created by Tae-Jin Oh on 2020/11/09.
//

import Foundation

func checkSocialNum(socialNumStr: String) -> Bool {
    if socialNumStr.count != 13 {
        print("Input Error: Must be 13 digits")
        return false
    }
    var socialNum = [Int]()
    let multiplyArr = [2,3,4,5,6,7,8,9,2,3,4,5]
    for char in socialNumStr {
        socialNum.append(Int(String(char))!)
    }
    var numVar = 0
    for ii in 0..<12 {
        numVar += socialNum[ii]*multiplyArr[ii]
    }
    return (11-numVar%11)%10 == socialNum[12]
}
