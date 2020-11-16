//
//  ViewController.swift
//  waitQueueApp
//
//  Created by Tae-Jin Oh on 2020/11/16.
//

import UIKit

class ViewController: UIViewController {
    var waiting = Waiting()
    @IBOutlet weak var waitingLabel: UILabel!
    @IBOutlet weak var queueNumLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var standbyButtonOutlet: UIButton!
    @IBOutlet weak var completeButtonOutlet: UIButton!
    func refreshUI() {
        queueNumLabel.text = "\(waiting.queNum)명"
        queueNumLabel.textColor = waiting.standbyLabelFontColor
        progressBar.progress = waiting.progress
        standbyButtonOutlet.backgroundColor = waiting.standbyButtonBackgroundColor
        standbyButtonOutlet.tintColor = waiting.standbyButtonFontColor
        completeButtonOutlet.backgroundColor = waiting.completeBackgroundColor
        completeButtonOutlet.tintColor = waiting.completeButtonFontColor
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refreshUI()
    }
    @IBAction func stabyBtn(_ sender: Any) {
        waiting.queAdd()
        refreshUI()
    }
    @IBAction func completeBtn(_ sender: Any) {
        waiting.complete()
        refreshUI()
    }
}

