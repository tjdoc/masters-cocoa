//
//  ViewController.swift
//  20201111_password
//
//  Created by Tae-Jin Oh on 2020/11/11.
//
// 추가 미션
//
//TODO:- 아주 강한 암호를 랜덤으로 만들어서 추천해주려면? - DONE
//TODO: 버튼을 누를 때 마다가 아니라 비밀번호를 입력할 때마다 하려면 어떻게 해야할까?


import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var passwordInput: UITextField!
    @IBOutlet weak var levelView: UIView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var strongPasswordLabel: UILabel!
    @IBOutlet weak var StrongPasswordOutput: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        StrongPasswordOutput.text = genStrongPassword()
        StrongPasswordOutput.textColor = UIColor.green
        // Do any additional setup after loading the view.
    }

    @IBAction func checkPWButton(_ sender: Any) {
        let passwordLevel = passwordValidator(password: passwordInput.text ?? "")
        let levelDict = [1: [UIColor.red, "아주 약한 암호"],
                         2: [UIColor.orange, "약한 암호"],
                         3: [UIColor.yellow, "보통 암호"],
                         4: [UIColor.blue, "강한 암호"],
                         5: [UIColor.green, "아주 강한 암호"]]
        descriptionLabel.text = levelDict[passwordLevel]![1] as? String
        levelView.backgroundColor = levelDict[passwordLevel]![0] as? UIColor
        StrongPasswordOutput.text = genStrongPassword()
    }    
}

