//
//  problem_6.swift
//  20201109
//
//  Created by Tae-Jin Oh on 2020/11/09.
//

import Foundation

func duplicatedWords(inputWords: [String]) -> [String] {
    var wordDict = [String: Int]()
    for word in inputWords {
        wordDict[word] = wordDict.keys.contains(word) ? wordDict[word]! + 1 : 1
    }
    return Array(wordDict.filter { $0.value > 1}.keys)
}
