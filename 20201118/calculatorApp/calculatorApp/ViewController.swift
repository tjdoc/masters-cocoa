//
//  ViewController.swift
//  calculatorApp
//
//  Created by Tae-Jin Oh on 2020/11/18.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var currentLabel: UILabel!
    @IBOutlet weak var stack1: UILabel!
    @IBOutlet weak var stack2: UILabel!
    @IBOutlet weak var stack3: UILabel!
    @IBOutlet weak var stack4: UILabel!
    @IBOutlet weak var stack5: UILabel!
    @IBOutlet weak var b0: UIButton!
    @IBOutlet weak var b1: UIButton!
    @IBOutlet weak var b2: UIButton!
    @IBOutlet weak var b3: UIButton!
    @IBOutlet weak var b4: UIButton!
    @IBOutlet weak var b5: UIButton!
    @IBOutlet weak var b6: UIButton!
    @IBOutlet weak var b7: UIButton!
    @IBOutlet weak var b8: UIButton!
    @IBOutlet weak var b9: UIButton!
    @IBOutlet weak var bDot: UIButton!
    @IBOutlet weak var bAdd: UIButton!
    @IBOutlet weak var bSubtract: UIButton!
    @IBOutlet weak var bMultiply: UIButton!
    @IBOutlet weak var bDivide: UIButton!
    @IBOutlet weak var bEvaluate: UIButton!
    
    var calc = Calculator()
    
    func refreshField() {
        currentLabel.text = calc.workingSpace
        if calc.stack.count > 0 {
            for ii in 1...calc.stack.count {
                switch ii {
                case 1:
                    stack1.text = String(calc.stack[0])
                case 2:
                    stack2.text = String(calc.stack[1])
                case 3:
                    stack3.text = String(calc.stack[2])
                case 4:
                    stack4.text = String(calc.stack[3])
                case 5:
                    stack5.text = String(calc.stack[4])
                default:
                    break
                }
            }
        }
        if calc.stack.count < 5 {
            for ii in calc.stack.count+1...5 {
                switch ii {
                case 1:
                    stack1.text = "Stack1"
                case 2:
                    stack2.text = "Stack2"
                case 3:
                    stack3.text = "Stack3"
                case 4:
                    stack4.text = "Stack4"
                case 5:
                    stack5.text = "Stack5"
                default:
                    break
                }
            }
        }
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refreshField()
        // Do any additional setup after loading the view.
    }
    @IBAction func btn0(_ sender: Any) {
        calc.input("0")
        refreshField()
    }
    @IBAction func btn1(_ sender: Any) {
        calc.input("1")
        refreshField()
    }
    @IBAction func btn2(_ sender: Any) {
        calc.input("2")
        refreshField()
    }
    @IBAction func btn3(_ sender: Any) {
        calc.input("3")
        refreshField()
    }
    @IBAction func btn4(_ sender: Any) {
        calc.input("4")
        refreshField()
    }
    @IBAction func btn5(_ sender: Any) {
        calc.input("5")
        refreshField()
    }
    @IBAction func btn6(_ sender: Any) {
        calc.input("6")
        refreshField()
    }
    @IBAction func btn7(_ sender: Any) {
        calc.input("7")
        refreshField()
    }
    @IBAction func btn8(_ sender: Any) {
        calc.input("8")
        refreshField()
    }
    @IBAction func btn9(_ sender: Any) {
        calc.input("9")
        refreshField()
    }
    @IBAction func btnDot(_ sender: Any) {
        calc.input(".")
        refreshField()
    }
    @IBAction func btnAdd(_ sender: Any) {
        calc.operate("+")
        refreshField()
    }
    @IBAction func btnSubtract(_ sender: Any) {
        calc.operate("-")
        refreshField()
    }
    @IBAction func btnMultiply(_ sender: Any) {
        calc.operate("*")
        refreshField()
    }
    @IBAction func btnDivide(_ sender: Any) {
        calc.operate("/")
        refreshField()
    }
    @IBAction func btnEvaluate(_ sender: Any) {
        calc.operate("=")
        refreshField()
    }
    @IBAction func btnClear(_ sender: Any) {
        calc.clear()
        refreshField()
    }
    @IBAction func btnReset(_ sender: Any) {
        calc.reset()
        refreshField()
    }
}

