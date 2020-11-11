//
//  ViewController.swift
//  20201111_TypeWord
//
//  Created by Tae-Jin Oh on 2020/11/11.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var currentWord: UILabel!
    @IBOutlet weak var nextWord: UILabel!
    @IBOutlet weak var inputField: UITextField!
    /// 루시드폴 4월의 춤 가사 중에서
    let wordList = ["슬퍼하지",
                    "말라고",
                    "원망하지",
                    "말라고",
                    "우릴",
                    "미워했던",
                    "사람들도",
                    "누군가의",
                    "꽃이었을테니",
                    "미워하지"].shuffled()
    /// NewYork Times 기사 중에서
    let wordList2 = ["The",
                     "president",
                     "and",
                     "his",
                     "allies",
                     "have",
                     "baselessly",
                     "claimed",
                     "that",
                     "rampant"].shuffled()
    var currentIdx = 1

    override func viewDidLoad() {
        super.viewDidLoad()
        self.inputField.delegate = self
        // Do any additional setup after loading the view.
        currentWord.text = wordList2[0]
        nextWord.text = wordList2[1]
        
        // dismiss keyboard when touching other area
        // code from https://stackoverflow.com/questions/24126678/close-ios-keyboard-by-touching-anywhere-using-swift
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))

        //Uncomment the line below if you want the tap not interfere and cancel other interactions.
        //tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    // entering text - enter key should perform same as checkButton
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // textField.resignFirstResponder()  //if desired
        performAction()
        return true
    }

    func performAction() {
        // correct input
        if inputField.text == currentWord.text && currentIdx <= wordList2.count - 1 {
            currentWord.textColor = UIColor.black
            currentWord.text = wordList2[currentIdx]
            nextWord.text = currentIdx <= wordList2.count - 2 ? wordList2[currentIdx+1] : ""
            currentIdx += 1
            inputField.text = ""
        } else {
            // incorrect input
            inputField.text = ""
            currentWord.textColor = UIColor.red
            // game over
            if currentIdx == wordList2.count {
                currentWord.textColor = UIColor.blue
                currentWord.text = "Game Over"
            }
        }

    }
    
    // code from stackoverflow dismissing keyboard
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }

    @IBAction func checkButton(_ sender: Any) {
        performAction()
    }
}

