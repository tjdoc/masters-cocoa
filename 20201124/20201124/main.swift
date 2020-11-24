//
//  main.swift
//  20201124
//
//  Created by Tae-Jin Oh on 2020/11/24.
//

import Foundation

class BackgroundWork {
    var thread : Thread? = nil
    
    func doTimeConsumingOperation(operation : Any?) {
        thread = Thread(target: self,
                   selector: #selector(BackgroundWork.runHelper), object: operation)
        thread?.start()
    }
    
    @objc func runHelper(operation : Any?) {
        let wait = 5
        autoreleasepool { () in
            // operation.do() ??
            print("Background: wait for \(wait) seconds: start")
            sleep(UInt32(wait))
            print("Background: wait for \(wait) seconds: complete")
        }
    }
}

//print("Thread test----------------")
//print("Main: start")
//let some = BackgroundWork()
//some.doTimeConsumingOperation(operation: nil)
//print("Main: middle")
//sleep(UInt32(10))
//print("Main: end")

/* output
 Thread test----------------
 Main: start
 Main: middle
 Background: wait for 5 seconds: start
 Background: wait for 5 seconds: complete
 Main: end
*/


func displayAllFiles(at path: String) {
    let fm = FileManager()
    let fileList: [String]
    do {
        try fileList = fm.contentsOfDirectory(atPath: path)
        fileList.forEach { print($0) }
    } catch {
        print("something went wrong")
    }
}

let sysPicturePath = "/System/Library/Desktop Pictures"
displayAllFiles(at: sysPicturePath)
