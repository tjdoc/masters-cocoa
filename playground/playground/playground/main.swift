//
//  main.swift
//  playground
//
//  Created by Tae-Jin Oh on 2020/11/20.
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
            print("wait for \(wait) seconds: start")
            sleep(UInt32(wait))
            print("wait for \(wait) seconds: complete")
        }
    }
}

print("start")
let some = BackgroundWork()
some.doTimeConsumingOperation(operation: nil)
print("middle")
sleep(UInt32(10))
print("end")

//start
//middle
//wait for 5 seconds: start
//wait for 5 seconds: complete
//end
