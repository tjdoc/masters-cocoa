//
//  ViewController.swift
//  Bingo
//
//  Created by Tae-Jin Oh on 2020/11/28.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var outNumArr: UILabel!
    @IBOutlet weak var currentNum: UILabel!
    @IBOutlet weak var genNum: UIButton!
    var bingo = randModel()
    func refreshUI() {
        outNumArr.text = bingo.numListStr
        currentNum.text = String(bingo.currentNum)
        genNum.setTitle(bingo.availableList.count != 0 ? "번호를 뙇!" : "Game Over", for: .normal)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        refreshUI()
    }

    @IBAction func genNumAction(_ sender: UIButton) {
        bingo.genRand()
        refreshUI()
    }
    @IBAction func reset(_ sender: UIButton) {
        bingo.reset()
        refreshUI()
    }
}

