//
//  problem_1.swift
//  20201116
//
//  Created by Tae-Jin Oh on 2020/11/16.
//

import Foundation

class Matrix: Equatable {
    var a, b, c, d: Double
    init(_ a0:Double=0, _ b0:Double=0, _ c0:Double=0, _ d0:Double=0) {
        (a,b,c,d) = (a0, b0, c0, d0)
    }
    public static func == (lhs: Matrix, rhs: Matrix) -> Bool {
        guard (lhs.a == rhs.a && lhs.b == rhs.b && lhs.c == rhs.c && lhs.d == rhs.d) else {
            return false
        }
        return true
    }
    public static func * (left: Matrix, right: Matrix) -> Matrix {
        Matrix(left.a*right.a + left.b*right.c,
               left.a*right.b + left.b*right.d,
               left.c*right.a + left.d*right.c,
               left.c*right.b + left.d*right.d)
    }
    public static func + (left: Matrix, right: Matrix) -> Matrix {
        Matrix(left.a+right.a,
               left.b+right.b,
               left.c+right.c,
               left.d+right.d)
    }
    func sum(with other: Matrix) -> Matrix { self+other }
    func product(with other: Matrix) -> Matrix { self*other }
    func show() {
        print(String(format:"| %9.2e %9.2e |", a, b))
        print(String(format:"| %9.2e %9.2e |", c, d))
    }
}
