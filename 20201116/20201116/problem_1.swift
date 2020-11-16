//
//  problem_1.swift
//  20201116
//
//  Created by Tae-Jin Oh on 2020/11/16.
//

import Foundation

class Matrix: Equatable {
    var a: Double
    var b: Double
    var c: Double
    var d: Double
    init(_ a0:Double=0, _ b0:Double=0, _ c0:Double=0, _ d0:Double=0) {
        (a,b,c,d) = (a0, b0, c0, d0)
    }
    public static func == (lhs: Matrix, rhs: Matrix) -> Bool {
        guard (lhs.a == rhs.a && lhs.b == rhs.b && lhs.c == rhs.c && lhs.d == rhs.d) else {
            return false
        }
        return true
    }
    func sum(with other: Matrix) -> Matrix {
        let out = Matrix()
        (out.a, out.b, out.c, out.d) = (a+other.a, b+other.b, c+other.c, d+other.d)
        return out
    }
    func product(with other: Matrix) -> Matrix {
        let out = Matrix()
        out.a = a*other.a + b*other.c
        out.b = a*other.b + b*other.d
        out.c = c*other.a + d*other.c
        out.d = c*other.b + d*other.d
        return out
    }
    func paddedString(_ num: Double) -> String {
        let maxLen = String(max(a,b,c,d)).count
        return String(repeating: " ", count: maxLen-String(num).count)+String(num)
    }
    func show() {
        print("| \(paddedString(a)) \(paddedString(b)) |")
        print("| \(paddedString(c)) \(paddedString(d)) |")
    }
}
