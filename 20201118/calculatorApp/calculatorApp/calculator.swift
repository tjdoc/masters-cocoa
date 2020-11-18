//
//  calculator.swift
//  calculatorApp
//
//  Created by Tae-Jin Oh on 2020/11/18.
//

import Foundation
import UIKit

struct Calculator {
    var workingSpace = ""
    var stack = [Double]()
    var operationMode: opMode = .null
    var evalComplete: Bool = false
    enum opMode {
        case add, sub, mul, div, null, eval
    }
    let opDic: [String: opMode] = ["+": .add, "-": .sub, "*": .mul, "/": .div, "=": .eval]
    func printState(_ debug:Bool = true) {
        if debug {
            print()
            print("workingSpace: \(workingSpace)")
            print("stack: \(stack)")
            print("operationMode: \(operationMode)")
            print("evalComplete: \(evalComplete)")
        }
    }
    mutating func input(_ inStr: String) {
        guard workingSpace.count < 18 else {
            printState()
            return
        }
        if workingSpace == "0" && inStr != "." {
            workingSpace = inStr
            printState()
            return
        }
        workingSpace += inStr
        printState()
    }
    mutating func operate(_ operator: String) {
        let temp: Double
        let inputOpMode = opDic[`operator`, default: .null]
        var lastStack: Double
        
        switch stack.count {
        case 0:
            stack.append(Double(workingSpace)!)
            operationMode = opDic[`operator`, default: .null]
            workingSpace = "0"
        case 1...5:
            if evalComplete {
                lastStack = Double(workingSpace)!
                evalComplete = false
            } else {
                lastStack = stack.popLast()!
            }
            switch operationMode {
            case .add:
                temp = lastStack + Double(workingSpace)!
            case .sub:
                temp = lastStack - Double(workingSpace)!
            case .mul:
                temp = lastStack * Double(workingSpace)!
            case .div:
                temp = lastStack / Double(workingSpace)!
            case .eval:
                temp = lastStack
            case .null:
                temp = Double(workingSpace)!
            }
            stack.append(temp)
        workingSpace = "0"
        default:
            reset()
        }
        operationMode = inputOpMode
        switch operationMode {
        case .eval:
            evalComplete = true
        default:
            evalComplete = false
        }
        printState()
    }
    mutating func clear() {
        workingSpace = "0"
        operationMode = .null
        printState()
    }
    mutating func reset() {
        clear()
        stack = [Double]()
        printState()
    }
}
