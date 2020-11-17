//
//  main.swift
//  20201117
//
//  Created by Tae-Jin Oh on 2020/11/17.
//

import Foundation

let arrayA: [Int]
arrayA = [1,4,-1,3,2]

// traverse list and print the value
func enumerateList(_ A: [Int]) {
    var ii = 0
    while A[ii] != -1 {
        print("\(A[ii]) -> ", terminator:"")
        ii = A[ii]
    }
    print("\(A[ii])")
}

// list length
func countOfList(_ A: [Int]) -> Int {
    var ii = 0, count = 1
    while A[ii] != -1 {
        count += 1
        ii = A[ii]
    }
    return count
}

// check if array is full or not
func isFullList(_ A: [Int]) -> Bool { A.count == countOfList(A) }

enumerateList(arrayA)
print(countOfList(arrayA))
print(isFullList(arrayA))
