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
//      physical keyboard OK
//      software keyboard ??

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var passwordInput: UITextField!
    @IBOutlet weak var levelView: UIView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var strongPasswordLabel: UILabel!
    @IBOutlet weak var StrongPasswordOutput: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        StrongPasswordOutput.text = genStrongPassword()
        StrongPasswordOutput.textColor = UIColor.green
        self.passwordInput.delegate = self
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    func action() {
        var passwordLevel = passwordValidator(password: passwordInput.text ?? "")
        passwordLevel = passwordInput.text == "" ? 1 : passwordLevel
        let levelDict = [1: [UIColor.red, "아주 약한 암호"],
                         2: [UIColor.orange, "약한 암호"],
                         3: [UIColor.yellow, "보통 암호"],
                         4: [UIColor.blue, "강한 암호"],
                         5: [UIColor.green, "아주 강한 암호"]]
        descriptionLabel.text = levelDict[passwordLevel]![1] as? String
        levelView.backgroundColor = levelDict[passwordLevel]![0] as? UIColor
        StrongPasswordOutput.text = genStrongPassword()
    }
    
    // 물리 키보드 입력시 실시간 암호수준 업데이트
    override func pressesBegan(_ presses: Set<UIPress>, with event: UIPressesEvent?) {
        action()
        super.pressesBegan(presses, with: event)
    }
    
    // return 치면 확인
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        action()
        return true
    }
    
    // 다른 지역 터치시 키보드 숨기기
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    @IBAction func checkPWButton(_ sender: Any) {
        action()
    }
}

