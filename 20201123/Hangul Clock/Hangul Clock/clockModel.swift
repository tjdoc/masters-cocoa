//
//  clockModel.swift
//  Hangul Clock
//
//  Created by Tae-Jin Oh on 2020/11/23.
//

import Foundation

func getCurrentTime() -> (Int, Int, Int) {
    let calendar = NSCalendar(calendarIdentifier: NSCalendar.Identifier.gregorian)
    let time = calendar?.components([.hour, .minute, .second], from: NSDate() as Date)
    return (time?.hour ?? 0, time?.minute ?? 0, time?.second ?? 0)
}

// mapping hour label tag number
func kor12Map(_ hour24: Int) -> [Int] {
    assert(hour24 >= 0 && hour24 < 24, "Invalid hour")
    let hour12 = hour24 <= 12 ? hour24 : hour24-12
    let amPM = hour24 < 12 ? [100, 101] : [100, 102]
    let numDict12 = [
        0: [0, 15], //"영시",
        1: [2, 15], // "한시",
        2: [3, 15], // "두시",
        3: [4, 15], // "세시",
        4: [5, 15], // "네시",
        5: [6, 8, 15], // "다섯시",
        6: [7, 8, 15], // "여섯시",
        7: [9, 10, 15], // "일곱시",
        8: [11, 12, 15], // "여덟시",
        9: [13, 14, 15], // "아홉시",
        10: [1, 15], // "열시",
        11: [1, 2, 15], // "열한시",
        12: [1, 3, 15] // "열두시"
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
        return [digit1+4, 14]
    case (1, _):
        return [4, digit1+4, 14]
    case (_, _):
        return [digit10-2, 4, digit1+4, 14]
    }
}

// Korean number string generator
func intToKor60(_ num60: Int) -> [String] {
    let numDict10 = [
        0: "영",
        1: "일",
        2: "이",
        3: "삼",
        4: "사",
        5: "오",
        6: "육",
        7: "칠",
        8: "팔",
        9: "구"
    ]
    assert(num60 >= 0 && num60 < 60, "Invalid number")
    let digit10 = num60/10
    let digit1  = num60%10
    switch (num60,digit1) {
    case (num60, _) where num60 == 0:
        return ["", "영"]
    case (num60, _) where num60 < 10:
        return ["", numDict10[digit1]!]
    case (num60, _) where num60 == 10:
        return ["십", ""]
    case (num60, _) where num60 < 20:
        return ["십", numDict10[digit1]!]
    case (num60, digit1) where digit1 == 0:
        return ["\(numDict10[digit10]!)십"]
    default:
        return ["\(numDict10[digit10]!)십", numDict10[digit1]!]
    }
}

struct KoreanTime {
    var (hour24, minute, second) = getCurrentTime()
//    var (hour24, minute, second) = (0,0,40)
    var isDayTime: Bool { get { hour24 >= 7 && hour24 <= 19 } }
    var hhArr: [Int] { get { kor12Map(hour24) } }
    var mmArr: [Int]? { get { kor60Map(minute) } }
    var ssArr: [String] { get { intToKor60(second) } }
    mutating func updateTime() { (hour24, minute, second) = getCurrentTime() }
//    mutating func updateTime() {
//        hour24 = (hour24 + 1)%24
//        minute = (minute + 1)%60
//        second = (second + 1)%60
//    }
}


