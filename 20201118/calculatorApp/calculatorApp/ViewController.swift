//
//  ViewController.swift
//  calculatorApp
//
//  Created by Tae-Jin Oh on 2020/11/18.
//
//FIXME: Reset Button text not showing. I think I messed up with stackView...

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var currentLabel: UILabel!
    @IBOutlet var stackCollection: [UILabel]!
    var calc = Calculator()
    func refreshField() {
        currentLabel.text = calc.workingSpace
        for stackLabel in stackCollection {
            let tag = stackLabel.tag
            if calc.stack.count > 0 && (1...calc.stack.count).contains(tag) {
                stackLabel.text = String(calc.stack[tag-1])
            } else {
                stackLabel.text = "Stack\(tag)"
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refreshField()
    }

    @IBAction func multiBtnAction(_ sender: UIButton) {
        let temp = sender.currentTitle!
        let operDict = ["÷":"/", "×":"*", "−":"-", "+":"+", "=":"="]
        if operDict.keys.contains(temp) {
            calc.operate(operDict[temp, default:""])
        } else {
            calc.input(operDict[temp, default:temp])
        }
        refreshField()
    }
    @IBAction func btnClear(_ sender: UIButton) {
        calc.clear()
        refreshField()
    }
    
    @IBAction func btnReset(_ sender: UIButton) {
        calc.reset()
        refreshField()
    }
    // shake event
    override func becomeFirstResponder() -> Bool {
        return true
    }
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            calc.reset()
            refreshField()
        }
    }

}

