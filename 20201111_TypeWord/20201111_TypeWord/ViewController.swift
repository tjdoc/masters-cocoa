//
//  ViewController.swift
//  20201111_TypeWord
//
//  Created by Tae-Jin Oh on 2020/11/11.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var currentWord: UILabel!
    @IBOutlet weak var nextWord: UILabel!
    @IBOutlet weak var inputField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
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
                    "미워하지"]
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
                     "rampant",]

    @IBAction func checkButton(_ sender: Any) {
    }
    

}

