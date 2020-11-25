//
//  problem_3.swift
//  20201125
//
//  Created by Tae-Jin Oh on 2020/11/25.
//

import Foundation

func download2DownloadsFolder(fileURL: String, saveAs: String) {
    let url = URL(string: fileURL)
    let downloadTask = URLSession.shared.downloadTask(with: url!) {
        urlOrNil, responseOrNil, errorOrNil in
        guard let fileURL = urlOrNil else { return }
        do {
            let documentsURL = try
                FileManager.default.url(for: .downloadsDirectory,
                                        in: .userDomainMask,
                                        appropriateFor: nil,
                                        create: false)
            let savedURL = documentsURL.appendingPathComponent(saveAs)
            try FileManager.default.moveItem(at: fileURL, to: savedURL)
        } catch {
            print ("file error: \(error)")
        }
    }
    downloadTask.resume()
}

func wordCount(content: String, word: String) -> Int {
    let regex = try! NSRegularExpression(pattern: word)
    return regex.numberOfMatches(in: content, options:[], range: (NSMakeRange(0, content.count)))
}

func wordCountAsync(concurrentNum: Int) {
    let fm = FileManager()
    // for dropbox, must use ...dl=1 to download the file. ...dl=0 results in downloading a html page
    let bookfileURL = "https://www.dropbox.com/s/v1z1ntyzm85lvey/bookfile.txt?dl=1"
    let bookfileName = "bookfile.txt"
    let downloadsDirectory = fm.urls(for: .downloadsDirectory, in: .userDomainMask).first!
    let localBookFileURL = downloadsDirectory.appendingPathComponent(bookfileName)
    let wordList = ["대중", "경제", "재산", "자유", "국제", "시장", "사상", "부자",
                    "학자", "개인", "욕망", "생활", "자원", "사람", "노동", "인물",
                    "소비", "사회", "이론", "새로운"]
    var wordCountDict = [String: Int]()
    var timeArr = [Double]()

    // download bookfile to Downloads directory if it does not exist
    if !fm.fileExists(atPath: localBookFileURL.path) {
        download2DownloadsFolder(fileURL: bookfileURL, saveAs: bookfileName)
        sleep(5)
    }
    
    let content = try! String(contentsOf: localBookFileURL, encoding: .utf8)
    let queue = DispatchQueue(label: "com.gcd.myQueue", attributes: .concurrent)
    let semaphore = DispatchSemaphore(value: concurrentNum) // how many threads you want to run concurrently
    let lock = NSLock()
    timeArr.append(Double(DispatchTime.now().uptimeNanoseconds)/1_000_000_000.0)
    
    for word in wordList {
        queue.async {
            semaphore.wait()
            let count = wordCount(content: content, word: word)
            // to avoid race condition
            lock.lock()
            wordCountDict[word] = count
            let currentTime = Double(DispatchTime.now().uptimeNanoseconds)/1_000_000_000.0
            timeArr.append(currentTime)
            lock.unlock()
            semaphore.signal()
        }
    }
    sleep(1)
    if concurrentNum == 1 {
        let sortedDic = wordCountDict.sorted(by: {$0.0 < $1.0})
        for (k,v) in sortedDic {
            print("\(k): \(v)")
        }
    }
    print("Elapsed time with concurrent "+String(format:"%2d", concurrentNum)+" threads: \(timeArr[timeArr.count-1]-timeArr[0])")
}
