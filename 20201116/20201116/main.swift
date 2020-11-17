//
//  main.swift
//  20201116
//
//  Created by Tae-Jin Oh on 2020/11/16.
//

import Foundation

func printPractice(_ practiceStr:String, _ major: Bool=true) {
    print()
    let div = major ? "=" : "."
    print(String(repeating: div, count: 50))
    print("Practice \(practiceStr)")
    print()
}

//==================================================
printPractice("1: matrix sum")

let mat1 = Matrix(1, 2, 3, 4)
let mat2 = Matrix(10, 100, 1000, 10000)
let mat3 = mat1.sum(with: mat2)
let mat4 = mat1 + mat2
let sol1 = Matrix(11, 102, 1003, 10004)
//mat3.show()
print("sum method:       ", mat3 == sol1 ? "PASS" : "FAIL")
print("sum operator:     ", mat4 == sol1 ? "PASS" : "FAIL")

printPractice("1: matrix product", false)

let mat7 = Matrix(1, 2, 3, 4)
let mat8 = Matrix(5, 6, 7, 8)
let mat9 = mat7.product(with: mat8)
let mat10 = mat7 * mat8
let sol2 = Matrix(19, 22, 43, 50)
print("product method:   ", mat9 == sol2 ? "PASS" : "FAIL")
print("product operator: ", mat10 == sol2 ? "PASS" : "FAIL")

//==================================================
printPractice("2: bit count")

let bit5 = SpecialBit(with: 5)
print("count test: ", bit5.count == 32 ? "PASS" : "FAIL")
print(bit5.find(by: 3))

//==================================================
printPractice("3: bubble sort test 1")
var randArr = [Int]()
for _ in 0..<10 {
    randArr.append(Int.random(in:0..<100))
}
var sortArr = BubbleSort(randArr)
print("original:   \(sortArr.valArr)")
print("ascending:  \(sortArr.sorted(isAscending: true))")
print("descending: \(sortArr.sorted(isAscending: false))")

printPractice("3: bubble sort test 2", false)
sortArr = BubbleSort(Array(0...10))
print("original:   \(sortArr.valArr)")
print("ascending:  \(sortArr.sorted(isAscending: true))")
print("descending: \(sortArr.sorted(isAscending: false))")
