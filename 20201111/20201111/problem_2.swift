//
//  problem_2.swift
//  20201111
//
//  Created by Tae-Jin Oh on 2020/11/11.
//

import Foundation

struct BaseBall {
    var ans = 0
    var guess = 0
    
    // original specification. Very little chance you can win this game
    mutating func newGame1() {
        self.ans = Int.random(in:100...999)
        self.guess = Int.random(in:100...999)
    }

    // modified number generator for better winning probability
    mutating func newGame2() {
        self.ans = Int.random(in:1...2)*100+Int.random(in:1...2)*10+Int.random(in:1...2)
        self.guess = Int.random(in:1...2)*100+Int.random(in:1...2)*10+Int.random(in:1...2)
    }

    func getDigits(num:Int) -> [Int] {
        var out = [Int]()
        out.append(num/100)
        out.append((num-100*out[0])/10)
        out.append(num%10)
        return out
    }

    func hit(num:Int) -> (strikeCount:Int, ballCount:Int) {
        var strikeCount = 0, ballCount = 0
        var ansArr = getDigits(num:self.ans)
        var numArr = getDigits(num:num)
        
        // check strikeCount
        for ii in stride(from:2, through:0, by:-1) {
            if ansArr[ii] == numArr[ii] {
                strikeCount += 1
                ansArr.remove(at:ii)
                numArr.remove(at:ii)
            }
        }
        
        // check remaining ballCount
        var ansCount: [Int: Int] = [:]
        var numCount: [Int: Int] = [:]
        for ii in 0..<ansArr.count {
            ansCount[ansArr[ii]] = (ansCount[ansArr[ii]] ?? 0) + 1
            numCount[numArr[ii]] = (numCount[numArr[ii]] ?? 0) + 1
        }
        for key in ansCount.keys {
            if numCount.keys.contains(key) {
                ballCount += min(ansCount[key]!, numCount[key]!)
            }
        }
        return (strikeCount:strikeCount, ballCount:ballCount)
    }
    
    mutating func showGameScore() -> Bool {
        var strikeOuts = 0
        var strikeCount: Int, ballCount: Int
        for _ in 0..<9 {
            // newGame1()
            newGame2()
            (strikeCount: strikeCount, ballCount: ballCount) = hit(num: self.guess)
            if strikeCount == 3 {
                strikeOuts += 1
            }
            print("\(self.ans) \(self.guess) strike:\(strikeCount) ball:\(ballCount), strickOuts: \(strikeOuts)")
        }
        return strikeOuts >= 3 ? true : false
    }
}
