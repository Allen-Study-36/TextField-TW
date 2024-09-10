//
//  ViewController.swift
//  TextField
//
//  Created by 김태완 on 9/6/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        textField.delegate = self

        setupUI()
    }

    func setupUI() {
        view.backgroundColor = .lightGray

        textField.keyboardType = .emailAddress
        textField.placeholder = "이메일을 입력하세요."
        textField.borderStyle = .roundedRect
        textField.clearButtonMode = .always
        textField.returnKeyType = .done

        textField.becomeFirstResponder()
    }

    // MARK: - 화면 클릭시 키보드 아웃
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        setupUI()
        textField.resignFirstResponder()
    }

    @IBAction func handleDoneAction(_ sender: UIButton) {
        textField.resignFirstResponder()
        textField.text = ""
    }

}

extension ViewController: UITextFieldDelegate {
    // MARK: - 10글자 제한
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let currentText = textField.text ?? ""
        let updatedText = (currentText as NSString).replacingCharacters(in: range, with: string)
        return updatedText.count <= 10
    }

    // MARK: - 빈 문자열이면 placeholder 변경
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.text == "" {
            textField.placeholder = "내용을 입력해 주세요❗️"
            return false
        } else {
            return true
        }
    }
}
