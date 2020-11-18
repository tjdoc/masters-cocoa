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
        for ii in 0..<Int(pow(2,Double(totalChar))) {
            let bitArr = Array(String(format: "%0\(totalChar)d", Int(String(ii, radix:2))!))
            (openCount, closeCount, balance) = (0, 0, 0)
            for idx in 0..<totalChar {
                balance += bitArr[idx] == "0" ? 1 : -1
                openCount += bitArr[idx] == "0" ? 1 : 0
                closeCount += bitArr[idx] == "1" ? 1 : 0
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
