//
//  problem_2.swift
//  20201116
//
//  Created by Tae-Jin Oh on 2020/11/16.
//

import Foundation

struct SpecialBit {
    private var values = [Int]()
    private var digit: Int
    init(with total: Int) {
        // truncating: pow가 표현하는 숫자가 Int의 범위를 넝어가지 않게 함
        for ii in 0..<(Int(truncating: pow(2,total) as NSNumber)) {
            values.append(ii)
        }
        digit = total
    }
    var count: Int {
        return values.count
    }
    func find(by bitcount: Int) -> [String] {
        var out = [String]()
        for val in values {
            var bitStr = String(val, radix:2)
            let padding = String(repeating:"0", count:digit-bitStr.count)
            bitStr = padding + bitStr
            if bitStr.filter({$0 == "1"}).count == bitcount {
                out.append(bitStr)
            }
        }
        return out
    }
}
