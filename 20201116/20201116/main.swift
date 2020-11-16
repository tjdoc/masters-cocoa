//
//  main.swift
//  20201116
//
//  Created by Tae-Jin Oh on 2020/11/16.
//

import Foundation

func printPractice(_ practiceStr:String) {
    print()
    print(String(repeating:"=", count:50))
    print("Practice \(practiceStr)")
    print()
}

//==================================================
printPractice("1: matrix sum, product")

let mat1 = Matrix(1,2,3,4)
let mat2 = Matrix(10,100,1000,10000)
let mat3 = mat1.sum(with: mat2)
let sol1 = Matrix(11, 102, 1003, 10004)
mat3.show()
print("sum test: ", mat3 == sol1 ? "PASS" : "FAIL")

let mat4 = Matrix(1,0,0,1)
let mat5 = Matrix(1,0,0,1)
let mat6 = mat4.product(with: mat5)
let sol2 = Matrix(1,0,0,1)
mat6.show()
print("product test: ", mat6 == sol2 ? "PASS" : "FAIL")

//==================================================
printPractice("2: bit count")

let bit5 = SpecialBit(with:5)
print("count test: ", bit5.count == 32 ? "PASS" : "FAIL")
print(bit5.find(by:3))

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

printPractice("3: bubble sort test 2")
sortArr = BubbleSort(Array(0...10))
print("original:   \(sortArr.valArr)")
print("ascending:  \(sortArr.sorted(isAscending: true))")
print("descending: \(sortArr.sorted(isAscending: false))")
