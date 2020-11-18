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

// https://en.wikipedia.org/wiki/Merge_sort translated C code to swift
class MergeSort {
    let ArrOriginal: [Int]
    var ArrA: [Int]
    var ArrB: [Int]
    let n: Int
    init(_ initArr: [Int]) {
        ArrOriginal = initArr
        ArrA = initArr
        ArrB = initArr
        n = ArrA.count
    }
    func topDownMergeSort() -> [Int] {
        topDownSplitMerge(&ArrB, 0, n, &ArrA)
        return ArrA
    }
    func topDownSplitMerge(_ B: inout [Int], _ iBegin: Int, _ iEnd: Int, _ A: inout [Int]) {
        if iEnd - iBegin <= 1 { return }
        let iMiddle = (iEnd + iBegin) / 2
        topDownSplitMerge(&A, iBegin, iMiddle, &B)
        topDownSplitMerge(&A, iMiddle, iEnd, &B)
        topDownMerge(&B, iBegin, iMiddle, iEnd, &A)
    }
    func topDownMerge(_ A: inout [Int], _ iBegin: Int, _ iMiddle: Int, _ iEnd: Int, _ B: inout [Int]) {
        var i = iBegin, j = iMiddle
        for k in iBegin..<iEnd {
            if i < iMiddle && (j >= iEnd || A[i] <= A[j]) {
                B[k] = A[i]
                i += 1
            } else {
                B[k] = A[j]
                j += 1
            }
        }
    }
}
