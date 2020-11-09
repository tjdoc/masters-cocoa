//
//  problem_1.swift
//  20201109
//
//  Created by Tae-Jin Oh on 2020/11/09.
//

import Foundation

// practice 1-1

struct ArrayPractice {
    var arr2D = [[Int]]()
    mutating func fillArray() -> [[Int]] {
        let rowNum = 5
        var jump = rowNum - 1
        var value = 1
        var outRow = [Int]()
        for row in 0 ..< rowNum {
            outRow = []
            for _ in 0...row {
                outRow.append(value)
                value += 1
            }
            self.arr2D.append(outRow)
            value += jump
            jump -= 1
        }
        return self.arr2D
    }
    mutating func printArray(array:[[Int]]) {
        for arrRow in array {
            print(arrRow)
        }
    }
}

// practice 1-2

func printArray(array: [[Bool]], newChar: String) {
    for arrRow in array {
        print()
        for col in arrRow {
            let printChar = col ? newChar : " "
            print(printChar, terminator:"")
        }
    }
    print()
}

func setBoolArray(_ size:Int = 7) -> [[Bool]] {
    var boolArr = Array(repeating: Array(repeating: false, count: size), count: size)
    for row in 0..<boolArr.count {
        for col in 0..<boolArr[row].count {
            boolArr[row][col] = (boolArr.count - col - 1 <= row) ? true : false
        }
    }
    return boolArr
}

// practice 1-3 MagicSquare

struct MagicSquare {
    var arr2D = [[Int]]()
    func moveLowerLeft(arr: [[Int]], irow: Int, icol: Int, size: Int) -> (Int, Int) {
        var row = irow + 1 >= size ? irow + 1 - size : irow + 1
        var col = icol - 1 < 0 ? icol - 1 + size : icol - 1
        if arr[row][col] != 0 {
            row = irow - 1 < 0 ? irow - 1 - size : irow - 1
            col = icol
        }
        return (row, col)
    }
    func moveUpperRight(arr: [[Int]], irow: Int, icol: Int, size: Int) -> (Int, Int) {
        var row = irow - 1 < 0 ? irow - 1 + size : irow - 1
        var col = icol + 1 >= size ? icol + 1 - size : icol + 1
        if arr[row][col] != 0 {
            row = irow + 1 >= size ? irow + 1 - size : irow + 1
            col = icol
        }
        return (row, col)
    }
    mutating func makeMagicSquare(row: Int) -> [[Int]] {
        var out = Array(repeating:Array(repeating:0, count:row), count:row)
        var (irow, icol) = (0, 0)
        if row%2 == 1 {
            // starting point. specifying row 5 is not necessary. just to match solution pattern of Lucas
            if row == 5 {
                (irow, icol) = (0, row/2)
            } else {
                (irow, icol) = (row-1, row/2)
            }
            for num in 1...(row*row) {
                out[irow][icol] = num
                // specifying row 5 is not necessary. just to match solution pattern of Lucas
                if row == 5 {
                    (irow, icol) = moveUpperRight(arr: out, irow: irow, icol: icol, size: row)
                } else {
                    (irow, icol) = moveLowerLeft(arr: out, irow: irow, icol: icol, size: row)
                }
            }
            self.arr2D = out
            return out
        } else {
            print("Error: Even number MagicSquare is incomplete")
            self.arr2D = [[0]]
            return [[0]]
        }
    }
    func checkMagicSquare() -> Bool {
        let magicSum = self.arr2D[0].reduce(0, +)
        var (rowSum, colSum, diagSum) = (0, 0, 0)
        for ii in 0..<arr2D[0].count {
            colSum = 0
            rowSum = self.arr2D[ii].reduce(0, +)
            if rowSum != magicSum {
                return false
            }
            for jj in 0..<self.arr2D[0].count {
                colSum += self.arr2D[ii][jj]
            }
            if colSum != magicSum {
                return false
            }
            diagSum += self.arr2D[ii][ii]
        }
        if diagSum != magicSum {
            return false
        }
        return true
    }
    func printMagicSquare() {
        let strSize = String(self.arr2D.count*self.arr2D.count).count
        for arrRow in self.arr2D {
            print()
            for val in arrRow {
                let spaces = String(repeating:" ", count:strSize - String(val).count)
                print(spaces, val, separator:" ", terminator:"")
            }
        }
        print()
    }
}
