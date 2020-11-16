//
//  waiting.swift
//  waitQueueApp
//
//  Created by Tae-Jin Oh on 2020/11/16.
//

import Foundation
import UIKit

class Waiting {
    var queNum: Int
    private let queMax = 20
    var standbyStatus: Bool {
        return queNum >= queMax ? false : true
    }
    var completeStatus: Bool {
        return queNum <= 0 ? false : true
    }
    var standbyLabelFontColor: UIColor {
        return standbyStatus ? .black : .red
    }
    var standbyButtonFontColor: UIColor {
        return standbyStatus ? .white : .blue
    }
    var standbyButtonBackgroundColor: UIColor {
        return standbyStatus ? .blue : .gray
    }
    var completeButtonFontColor: UIColor {
        return completeStatus ? .white : .blue
    }
    var completeBackgroundColor: UIColor {
        return completeStatus ? .blue : .gray
    }
    var progress: Float {
        return Float(queNum) / Float(queMax)
    }
    init() {
        queNum = 0
    }
    func queAdd() {
        switch queNum {
        case queNum where queNum+1 <= queMax:
            queNum += 1
        default:
            break
        }
    }
    func complete() {
        switch queNum {
        case queNum where queNum > 0:
            queNum -= 1
        default:
            break
        }
    }
}
