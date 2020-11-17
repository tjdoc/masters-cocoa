//
//  problem_3.swift
//  20201116
//
//  Created by Tae-Jin Oh on 2020/11/16.
//

import Foundation

class BubbleSort {
    let valArr: [Int]
    init(_ initArr: [Int]) {
        valArr = initArr
    }
    func sorted(isAscending: Bool) -> [Int] {
        var arrCopy = valArr
        var swapped: Bool
        var lastIndex = arrCopy.count-1
        func swap(arr: inout [Int], aIndex: Int, bIndex: Int) {
            let temp = arr[aIndex]
            arr[aIndex] = arr[bIndex]
            arr[bIndex] = temp
        }
        repeat {
            swapped = false
            for ii in 1...lastIndex {
                switch (arrCopy[ii - 1] < arrCopy[ii], isAscending) {
                case (true, false), (false, true):
                    swap(arr: &arrCopy, aIndex: ii - 1, bIndex: ii)
                    swapped = true
                default:
                    continue
                }
            }
            lastIndex -= 1
        } while swapped && lastIndex != 0
        return arrCopy
    }
}
