//
//  ViewController.swift
//  Hangul Clock
//
//  Created by Tae-Jin Oh on 2020/11/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var hourLabel: [UILabel]!
    @IBOutlet weak var dayNightLabel: UILabel!
    @IBOutlet var minuteLabel: [UILabel]!
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet var allBigLabels: [UILabel]!
    let fontCoeff1: CGFloat = 0.09
    let fontCoeff2: CGFloat = 0.033
    var currentTime = KoreanTime()

    @objc func refreshUI() {
        currentTime.updateTime()
        allBigLabels.forEach {
            $0.textColor = .darkGray
            $0.font = $0.font.withSize(self.view.frame.height * fontCoeff1)
        }
        secondLabel.font = secondLabel.font.withSize(self.view.frame.height * fontCoeff2)
        dayNightLabel.text = currentTime.isDayTime ? "😎" : "🌙"
        switch currentTime.second {
        case 0:
            secondLabel.text = "정각\n"
        case 1...9:
            secondLabel.text = "\(currentTime.ssArr.joined())초\n"
        case currentTime.second where currentTime.second%10 == 0:
            secondLabel.text = "\(currentTime.ssArr.joined())\n초"
        default:
            secondLabel.text = "\(currentTime.ssArr.joined(separator:"\n"))초"
        }
        for hhTag in currentTime.hhArr {
            hourLabel.filter{ $0.tag == hhTag }
                .forEach{ $0.textColor = .white }
        }
        if let mmArr = currentTime.mmArr {
            for mmTag in mmArr {
                minuteLabel.filter{ $0.tag == mmTag }
                    .forEach{ $0.textColor = .white }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refreshUI()
        // sync second
        usleep(useconds_t(1_000_000-(currentTime.nanosecond/1_000)))
        // async - inspired by Isaac's code
        let clock = DispatchWorkItem {
            Timer.scheduledTimer(timeInterval: 1,
                                 target: self,
                                 selector: #selector(self.refreshUI),
                                 userInfo: nil,
                                 repeats: true)
        }
        DispatchQueue.main.async(execute: clock)
    }
}


