//
//  main.swift
//  playground
//
//  Created by Tae-Jin Oh on 2020/11/13.
//
import Foundation

struct Matrix {
    var rows: Int
    var cols: Int
    var data: [Any]
    init(r: Int, c: Int, vals: [Any]) {
        assert(vals.count == r*c, "vals.count must be r*c")
        (rows, cols, data) = (r, c, vals)
    }
    func indexIsValid(row:Int, col:Int) -> Bool {
        return row >= 0 && row < rows && col >= 0 && col < cols
    }
    subscript(row:Int, col:Int) -> Any {
        get {
            assert(indexIsValid(row:row, col:col), "Index out of range")
            return data[(row*cols)+col]
        }
        set {
            assert(indexIsValid(row:row, col:col), "Index out of range")
            data[(row*cols)+col] = newValue
        }
    }
    func show() {
        for row in 0..<rows {
            print("| ", terminator:"")
            for col in 0..<cols {
                print("\(self[row,col]) ", terminator:"")
            }
            print("|")
        }
        print()
    }
}

let aa = Matrix(r:3, c:4, vals: Array(25..<25+12))
aa.show()
let (a, b) = (2, 10)
print(Int(pow(Double(a), Double(b))))

print("--"+String(format:"%05d", 1)+"----") // zero padded
print("--"+String(format:"%5d", 1)+"----")  // right adjusted
print("--"+String(format:"%-5d", 1)+"----") // left adjusted
print("--"+String(format:"%5.2f", 1.0/3.0)+"----")
