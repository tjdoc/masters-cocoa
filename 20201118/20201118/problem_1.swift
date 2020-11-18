//
//  problem_1.swift
//  20201118
//
//  Created by Tae-Jin Oh on 2020/11/18.
//

import Foundation

struct BracketMatch {
    let b0, b1, bb: String
    enum Bracket {
        case round, square, curly
    }
    init(with: Bracket) {
        switch with {
        // b0: 여는 괄호, b1: 닫는 괄호, bb: pair
        case .round:
            (b0, b1, bb) = ("(", ")", "()")
        case .square:
            (b0, b1, bb) = ("[", "]", "[]")
        case .curly:
            (b0, b1, bb) = ("{", "}", "{}")
        }
    }
    func generate(with count: Int) -> [String] {
        var openCount, closeCount, balance : Int
        let totalChar = 2*count
        var out = [String]()
        assert(count >= 0, "must use zero or positive number")
        guard count != 0 else {
            return [""]
        }
        for ii in 0..<Int(pow(2,Double(totalChar-1)).rounded()) {
            // totalChar로 나타날 수 있는 모든 경우의 수를 이진수로 표현. 0은 여는 괄호, 1은 닫는 괄호.
            // 단, 배열 첫번째 항은 여는 괄호로 시작하도록 강제함
            var bitArr = Array(String(format: "%0\(totalChar)d", Int(String(ii, radix:2))!))
            bitArr[0] = "0" // 반드시 열린 괄호로 시작
            (openCount, closeCount, balance) = (1, 0, 1)
            for idx in 1..<totalChar {
                balance += bitArr[idx] == "0" ? 1 : -1   // idx 까지의 (여는 괄호 개수) - (닫는 괄호 개수)
                openCount += bitArr[idx] == "0" ? 1 : 0  // idx 까지의 여는 괄호 개수
                closeCount += bitArr[idx] == "1" ? 1 : 0 // idx 까지의 닫는 괄호 개수
                guard (balance >= 0 && openCount <= count && closeCount <= count) else {
                    break
                }
                if idx == totalChar-1 && balance == 0 && openCount == count && closeCount == count {
                    out.append(String(bitArr).replacingOccurrences(of: "0", with: b0)
                                             .replacingOccurrences(of: "1", with: b1))
                }
            }
        }
        return out
    }
    func analyze(with value:String) -> Bool {
        var workStr = value
        while workStr.contains(bb) {
            workStr = workStr.replacingOccurrences(of: bb, with: "")
        }
        return workStr.count == 0
    }
}
