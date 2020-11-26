//
//  problem_2.swift
//  20201125
//
//  Created by Tae-Jin Oh on 2020/11/24.
//

import Foundation

class CsvProcessor {
    var csvData = [[String: Any]]()
    let fm = FileManager()
    var keyList = [String]()
    // initializes with csv file path
    init(csvFilePath: String) {
        let fileURL = URL(fileURLWithPath: csvFilePath, isDirectory: false)
        readCSV(fileURL: fileURL)
    }
    // initializes with csv file at user desktop
    init(csvFileName: String) {
        let desktopDirectory = fm.urls(for: .desktopDirectory, in: .userDomainMask).first!
        //let downloadDirectory = fm.urls(for: .downloadsDirectory, in: .userDomainMask).first!
        let fileURL = desktopDirectory.appendingPathComponent(csvFileName)
        readCSV(fileURL: fileURL)
    }
    func readCSV(fileURL: URL) {
        assert(fm.fileExists(atPath: fileURL.path), "CSV file does not exist")
        do {
            let csvRecords = try String(contentsOf: fileURL, encoding: .utf8).split(separator: "\n")
            for (ii, record) in csvRecords.enumerated() {
                switch ii {
                case 0:
                    record.split(separator: ",").forEach
                    {keyList.append(String($0.trimmingCharacters(in: .whitespaces)))}
                default:
                    var tempDic = [String: Any]()
                    for (ii, val) in record.split(separator: ",").enumerated() {
                        tempDic[keyList[ii]] = ii == 3 ?
                            Int(val.trimmingCharacters(in: .whitespaces)) ?? 0 : val.trimmingCharacters(in: .whitespaces)
                    }
                    csvData.append(tempDic)
                }
            }
        }
        catch let error as NSError {
            print("Error creating File : \(error.localizedDescription)")
        }
    }
    
    func add(name: String, email: String, language: String, grade: Int) {
        csvData.append(["name": name, "email": email, "language": language, "grade": grade])
    }
    func findBy(name: String) -> [String: Any] {
        let out = csvData.filter {$0["name"] as! String == name}
        guard out.count == 1 else {
            return ["\(name) not found": 0]
        }
        return out[0]
    }
    func removeBy(email: String) -> Bool {
        for (ii, data) in csvData.enumerated() {
            if data["email"] as! String == email {
                csvData.remove(at: ii)
                return true
            }
        }
        return false
    }
    func show() {
        print("\(keyList[0]), \(keyList[1]), \(keyList[2]), \(keyList[3])")
        csvData.forEach {
            print("\($0["name"]!), \($0["email"]!),\($0["language"]!), \($0["grade"]!)")
        }
    }
    func writeToPath(filePath: String) -> Bool {
        return writeOperation(fileURL: URL(fileURLWithPath: filePath, isDirectory: false))
    }
    func writeToDesktop(fileName: String) -> Bool {
        let desktopDirectory = fm.urls(for: .desktopDirectory, in: .userDomainMask).first!
        let fileURL = desktopDirectory.appendingPathComponent(fileName)
        return writeOperation(fileURL: fileURL)
    }
    func writeOperation(fileURL: URL) -> Bool {
        guard !fm.fileExists(atPath: fileURL.path) else {return false}
        do {
            var csvContent = [String]()
            csvContent.append(keyList.joined(separator: ", "))
            csvData.forEach {
                csvContent.append("\($0["name"]!), \($0["email"]!),\($0["language"]!), \($0["grade"]!)")
            }
            do {
                try csvContent.joined(separator: "\n").write(to: fileURL, atomically: false, encoding: .utf8)
            }
        } catch let error as NSError {
            print("Error Writing File : \(error.localizedDescription)")
            return false
        }
        return true
    }
}
