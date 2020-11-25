//
//  problem_1.swift
//  20201125
//
//  Created by Tae-Jin Oh on 2020/11/24.
//

import Foundation

func files(at path: String, sort: Bool = false) -> [String] {
    let fm = FileManager()
    do {
        return try sort ? fm.contentsOfDirectory(atPath: path).sorted()
            :fm.contentsOfDirectory(atPath: path)
    } catch {
        return [""]
    }
}

func isExist(filename: [String], at path: String) -> [Bool] {
    let filesAtPath = files(at: path)
    var out = [Bool]()
    filename.forEach {out += filesAtPath.contains($0) ? [true] : [false]}
    return out
}

func searchExtension(extension: String, at path: String, sort: Bool = false) -> [String] {
    let filesAtPath = files(at: path)
    var out = [String]()
    do {
        let regex = try NSRegularExpression(pattern: ".*.\(`extension`)$")
        filesAtPath.forEach {
            let range = NSRange(location: 0, length: $0.utf16.count)
            if regex.firstMatch(in: $0, options: [], range: range) != nil {
                out.append($0)
            }
        }
        return out
    } catch {
        return [""]
    }
}
