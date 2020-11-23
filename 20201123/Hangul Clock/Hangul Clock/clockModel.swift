//
//  clockModel.swift
//  Hangul Clock
//
//  Created by Tae-Jin Oh on 2020/11/23.
//

import Foundation

func getCurrentTime() -> (Int, Int, Int, Int) {
    let calendar = NSCalendar(calendarIdentifier: NSCalendar.Identifier.gregorian)
    let time = calendar?.components([.hour, .minute, .second, .nanosecond], from: NSDate() as Date)
    return (time?.hour ?? 0, time?.minute ?? 0, time?.second ?? 0, time?.nanosecond ?? 0)
}

// mapping hour label tag number
func kor12Map(_ hour24: Int) -> [Int] {
    assert(hour24 >= 0 && hour24 < 24, "Invalid hour")
    let hour12 = hour24 <= 12 ? hour24 : hour24-12
    let amPM = hour24 < 12 ? [100, 101] : [100, 102]
    let numDict12 = [
        0: [0, 15], // 0:"영", 15:"시"
        1: [2, 15], // 2:"한", 15:"시"
        2: [3, 15], // ...
        3: [4, 15],
        4: [5, 15],
        5: [6, 8, 15],
        6: [7, 8, 15],
        7: [9, 10, 15],
        8: [11, 12, 15],
        9: [13, 14, 15],
        10: [1, 15],
        11: [1, 2, 15],
        12: [1, 3, 15]
    ]
    return amPM + numDict12[hour12]!
}

// mapping minute label tag number
func kor60Map(_ num60: Int) -> [Int]? {
    let digit10 = num60/10
    let digit1  = num60%10
    switch (digit10, digit1) {
    case (0, 0):
        return nil
    case (0, _):
        return [digit1+4, 14]               // x:"몇" 14:"분"
    case (1, _):
        return [4, digit1+4, 14]            // 4:"십" x:"몇" 14:"분"
    case (_, _):
        return [digit10-2, 4, digit1+4, 14] // x:"몇" 4:"십" y:"몇" 14:"분"
    }
}

// Korean number string generator
func intToKor60(_ num60: Int) -> [String] {
    let numArr = ["", "일", "이", "삼", "사", "오", "육", "칠", "팔", "구"]
    assert(num60 >= 0 && num60 < 60, "Invalid number")
    let digit10 = num60/10
    let digit1  = num60%10
    switch num60 {
    case 0..<10:
        return [numArr[digit1]]
    case 10..<20:
        return ["십", numArr[digit1]]
    default:
        return ["\(numArr[digit10])십", numArr[digit1]]
    }
}

struct KoreanTime {
    var (hour24, minute, second, nanosecond) = getCurrentTime()
    var isDayTime: Bool { get { hour24 >= 7 && hour24 <= 19 } }
    var hhArr: [Int] { get { kor12Map(hour24) } }
    var mmArr: [Int]? { get { kor60Map(minute) } }
    var ssArr: [String] { get { intToKor60(second) } }
    mutating func updateTime() { (hour24, minute, second, nanosecond) = getCurrentTime() }
}


