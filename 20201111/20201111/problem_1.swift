//
//  problem_1.swift
//  20201111
//
//  Created by Tae-Jin Oh on 2020/11/11.
//

import Foundation

struct Interest {
    func getInterestRate(byDay: Int) -> Double {
        switch byDay {
        case byDay where 0 <= byDay && byDay <= 90:
            return 0.005
        case byDay where byDay <= 180:
            return 0.01
        case byDay where byDay <= 364:
            return 0.02
        default:
            return 0.056
        }
    }
    func calculateAmount(day:Int, amount:Int) -> Double {
        return (1+getInterestRate(byDay: day))*Double(amount)
    }
}
