//
//  main.swift
//  20201109
//
//  Created by Tae-Jin Oh on 2020/11/09.
//

import Foundation

func printPractice(_ practiceStr:String) {
    print()
    print(String(repeating:"=", count:50))
    print("Practice \(practiceStr)")
    print()
}

// pratice 1-1
printPractice("1-1")
var myArray = ArrayPractice()
myArray.printArray(array:myArray.fillArray())

// practice 1-2
printPractice("1-2")
let myBoolArr = setBoolArray()
printArray(array: myBoolArr, newChar:"$")

//practice 1-3 MagicSquare
printPractice("1-3")
var myMagic = MagicSquare()
_ = myMagic.makeMagicSquare(row: 3)
print("solution correct?: \(myMagic.checkMagicSquare())")
myMagic.printMagicSquare()

_ = myMagic.makeMagicSquare(row: 5)
print("\nsolution correct?: \(myMagic.checkMagicSquare())")
myMagic.printMagicSquare()

_ = myMagic.makeMagicSquare(row: 9)
print("\nsolution correct?: \(myMagic.checkMagicSquare())")
myMagic.printMagicSquare()


// practice 2
printPractice("2")
let passDict1 =
    ["!what": false,
     "hello ": false,
     "toolongpasswordthisisverylong": false,
     "shor": false,
     "11ok23": true,
     "11ok2356": true,
     "11ok2223": false,
     "11ok2348": false,
     "11ok9015": false,]
for (key, val) in passDict1 {
    let result = IDValidator(password: key) == val ? "PASS" : "FAIL"
    print("\(result): \(key)")
}

// practice 3
printPractice("3")
let passDict2 =
    ["123456": 1,
     "abcdee": 2,
     "abcd1234": 4,
     "abcd123!": 5,
     "111122223333": 3,
     "aaaabbbbcccc": 3,
     "a1": 3,
     "ab?": 3]
for (key, val) in passDict2 {
    let result = passwordValidator(password: key) == val ? "PASS" : "FAIL"
    print("\(result) Level \(val): \(key)")
}
     
// practice 4
printPractice("4")
print(checkSocialNum(socialNumStr: "1234561234567")) // actual SSN number blinded. Solution confirmed

// practice 5
printPractice("5")
var initArr = [1]
for _ in 0..<9 {
    print(initArr)
    initArr = antFunction(inputArray:initArr)
}

// practice 6
printPractice("6")
print(duplicatedWords(inputWords: ["가을", "우주", "너굴", "우주", "겨울", "봄봄", "너굴", "너굴"]))
print(duplicatedWords(inputWords: ["가을", "너굴", "우주", "겨울", "봄봄", "여울"]))
