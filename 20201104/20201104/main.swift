//
//  main.swift
//  codesquad_swift
//
//  Created by Tae-Jin Oh on 2020/11/04.
//

import Foundation


// 20201104

// Mission 1

func printXY(max : Int) {
    for _ in 1...max {
        print()
        for jj in 1...max {
            print(jj, terminator: " ")
        }
    }
}
printXY(max: 3)
print()
printXY(max: 5)
print()

// Mission 2

func printLeftTree(lines : Int) {
    let tree = "🎈"
    for line in 1...lines {
        print()
        for _ in 1...line {
            print(tree, terminator:"")
        }
    }
}

printLeftTree(lines:5)
print()

// Mission 3

func printRightTree(lines : Int) {
    let tree = "🎈"
    var space: String
    for line in 1...lines {
        print()
        space = ""
        for _ in (0...(lines-line)) {
            space += "  "
        }
        print(space, terminator:"")
        for _ in 1...line {
            print(tree, terminator:"")
        }
    }
}
printRightTree(lines: 4)
print()

// Mission 4 printCenterTree

func printCenterTree(lines: Int, tree:String = "🎈") {
    var space: String
    for line in 1...lines {
        print()
        space = ""
        for _ in (0...(lines-line)) {
            space += " "
        }
        print(space, terminator:"")
        for _ in 1...line {
            print(tree, terminator:"")
        }
    }

}
printCenterTree(lines:5)
print()

// Mission 5-1 printNumbers

func printNumbers(lines: Int) {
    var num: Int = 0
    var snum: String
    var maxnum: Int = 0
    for ii in 1...lines {
        maxnum += ii
    }
    let maxlen = String(maxnum).count
    print()
    for line in 0..<lines {
        print()
        for _ in 0...line {
            num += 1
            snum = ""
            for _ in 0...max(0,(maxlen-String(num).count)) {
                snum += " "
            }
            snum += String(num)
            print(snum, terminator: "")
        }
    }
    
}
printNumbers(lines:5)
print()
printNumbers(lines:20)

// Mission 5-2 printSquare

func printSquare(columns: Int) {
    var snum: String
    print()
    for ii in 1...25 {
        if ii <= 9 {
            snum = " \(ii)"
        } else {
            snum = String(ii)
        }
        print(snum, terminator: " ")
        if ii%columns == 0 {
            print()
        }
    }
}

printSquare(columns: 4)
print()
print()

// Mission 5-3 printReverse

func printReverse(lines: Int) {
    for line in 1...lines {
        var numArr = Array(lines*(line-1)+1...lines*line)
        if line%2 == 0 {
            numArr.reverse()
        }
        for ii in numArr {
            print(ii, terminator:" ")
        }
        print()
    }
}
printReverse(lines:4)
print()
printReverse(lines:5) // 문제 해답 오류??
print()

// Mission 6 printDiamond

func printCenterChar(lines: Int, tree:String="*") {
    var space: String
    for line in 1...lines {
        print()
        space = ""
        for _ in (0...(lines-line)) {
            space += " "
        }
        print(space, terminator:"")
        for _ in 0...(2*(line-1)) {
            print(tree, terminator:"")
        }
    }
}
//printCenterChar(lines:5)
func printCenterCharReverse(lines: Int, tree:String="*") {
    var trees: String
    for line in 1...lines {
        print()
        for _ in 0...(line-1) {
            print(" ", terminator:"")
        }
        trees = ""
        for _ in (0...(2*(lines-line))) {
            trees += tree
        }
        print(trees, terminator:"")
    }
}
//printCenterCharReverse(lines:5)

func printDiamond(lines: Int) {
    print("\n\(lines)")
    if lines == 1 {
        printCenterChar(lines:1)
    }
    else if lines%2 == 0 {
        printCenterChar(lines:lines/2)
        printCenterCharReverse(lines:lines/2)
    } else {
        printCenterChar(lines:lines/2)
        print()
        for _ in (1...lines) {
            print("*", terminator:"")
        }
        printCenterCharReverse(lines:lines/2)
    }
    print()
}
//printDiamond(lines:1)
//printDiamond(lines:2)
//printDiamond(lines:3)
printDiamond(lines:4)
print()
//printDiamond(lines:5)
printDiamond(lines:7)
print()

// Mission 7 print3515

func clap369(lines: Int) -> Array<String> {
    var out:Array<String> = []
    for ii in 1...lines {
        if ii%15 == 0 {
            out.append("👏🏼🙏")
        } else if ii%5 == 0 {
            out.append("🙏")
        } else if ii%3 == 0 {
            out.append("👏🏼")
        } else {
            out.append(String(ii))
        }
    }
    return out
}
print(clap369(lines:15))
print()

// 추가미션 1

func arrXY(max : Int)->Array<Array<Int>> {
    var out = Array(repeating: Array(repeating:0, count: max), count: max)
    for ii in 0..<max {
        for jj in 0..<max {
            out[ii][jj] = jj+1
        }
    }
    for ii in 0..<max {
        print()
        for val in out[ii] {
            print(val, terminator: " ")
        }
    }
    return out
}

_ = arrXY(max:3)
print()
_ = arrXY(max:5)
print()
print()

// 추가미션 2

func arrLeftTree(lines: Int) ->Array<Array<String>> {
    var out = Array(repeating: Array(repeating:"", count: lines), count: lines)
    for row in 0..<lines {
        for col in 0..<lines{
            if row >= col {
                out[row][col] = "🎈"
            } else {
                out[row][col] = "  "
            }
        }
    }
    for row in 0..<lines {
        print(out[row].joined(separator:""))
    }
    return out
    
}

_ = arrLeftTree(lines:5)
print()

// 추가미션 3

func arrRightTree(lines: Int) ->Array<Array<String>> {
    var out = Array(repeating: Array(repeating:"", count: lines), count: lines)
    for row in 0..<lines {
        for col in 0..<lines {
            if row <= col {
                out[row][col] = "🎈"
            } else {
                out[row][col] = "  "
            }
        }
    }
    for row in 0..<lines {
        print(out[row].joined(separator:""))
    }
    return out
}

_ = arrRightTree(lines:4)
print()

// 추가미션 4

func arrCenterTree(lines:Int, tree:String = "🎈") -> Array<Array<String>> {
    var out = Array(repeating: Array(repeating:"", count: lines), count: lines)
    for row in 0..<lines {
        for col in 0..<lines-row-1 {
            out[row][col] = " "
        }
        for col in lines-row-1..<lines {
            out[row][col] = tree
        }
    }
    for row in 0..<lines {
        print(out[row].joined(separator:""))
    }
    return out
}

_ = arrCenterTree(lines:5)
print()

// 추가미션 5-1 arrNumbers

func arrNumbers(lines: Int) -> Array<Array<String>> {
    var out = Array(repeating: Array(repeating:"", count: lines), count: lines)
    var num: Int = 0
    var snum: String
    var maxnum: Int = 0
    for ii in 1...lines {
        maxnum += ii
    }
    let maxlen = String(maxnum).count
    for row in 0..<lines {
        for col in 0..<lines {
            if col <= row {
                num += 1
                snum = ""
                for _ in 0...max(0,(maxlen-String(num).count)) {
                    snum += " "
                }
                snum += String(num)
                out[row][col] = snum
            }
        }
    }
    for row in 0..<lines {
        print(out[row].joined(separator:""))
    }
    return out
}

_ = arrNumbers(lines: 5)
print()

// 추가미션 5-2 arrSquare

func arrSquare(columns: Int) -> Array<Array<String>> {
    var out = Array(repeating:Array(repeating:"", count:columns), count:Int(ceil(24.0/Float(columns))))
    var num = 0
    for row in 0...out.count {
        for col in 0..<columns {
            num += 1
            if num <= 9 {
                out[row][col] = " " + String(num)
            } else if num <= 25 {
                out[row][col] = String(num)
            }
        }
    }
    for row in 0..<out.count {
        print(out[row].joined(separator:" "))
    }
    return out
    
}

_ = arrSquare(columns:5)
print()

// 추가미션 5-3 arrReverse
func arrReverse(lines: Int) -> Array<Array<Int>> {
    var out = Array(repeating:Array(repeating:0, count:lines), count:lines)
    var arr1d = Array(repeating: 0, count:lines)
    var num = 1
    for row in 0..<lines {
        arr1d = Array(num..<num+lines)
        // even row (zero based index)
        if row%2 == 1 {
            arr1d.reverse()
        }
        out[row] = arr1d
        num += lines
    }
    for row in 0..<lines {
        for val in out[row] {
            print(val, terminator:" ")
        }
        print()
    }
    return out
}

_ = arrReverse(lines:4)
print()
_ = arrReverse(lines:5)
print()

// 추가미션 6 arrDiamond

func arrCenterChar(lines: Int, rev:Bool=false, vis:Bool=false) -> Array<Array<String>> {
    var out = Array(repeating:Array(repeating:" ", count:2*lines), count:lines)
    for row in 0..<lines {
        for col in ((lines-row)..<(lines-row+2*(row)+1)) {
            out[row][col] = "*"
        }
    }
    if rev {
        out.reverse()
    }
    // visualize
    if vis {
        for row in 0..<lines {
            print(out[row].joined(separator:""))
        }
        for ii in 1...2*lines {
            print(ii,terminator:"")
        }
    }
    return out
}

//print()
//_ = arrCenterChar(lines:4, vis:true)
//print()
//_ = arrCenterChar(lines:5, vis:true)
//print()

func arrDiamond(lines: Int) -> Array<Array<String>> {
    var out = Array(repeating: Array(repeating:" ", count:lines), count:lines)
    if lines == 1 {
        out = arrCenterChar(lines: lines)
    } else if lines%2 == 0 {
        out[0..<lines/2] = arrCenterChar(lines:lines/2)[...]
        out[lines/2..<lines] = arrCenterChar(lines:lines/2, rev:true)[...]
        
    } else {
        out[0..<lines/2] = arrCenterChar(lines:lines/2)[...]
        out[lines/2] = Array(repeating:"*", count:lines)
        out[lines/2+1..<lines] = arrCenterChar(lines:lines/2, rev:true)[...]
    }
    for row in 0..<lines {
        print(out[row].joined(separator:""))
    }
    return out
}

_ = arrDiamond(lines:4)
print()
_ = arrDiamond(lines:7)
print()
