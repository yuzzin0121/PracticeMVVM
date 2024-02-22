//
//  ViewController.swift
//  SeSACWeek10MVVM
//
//  Created by 조유진 on 2/22/24.
//

import UIKit

// 뷰적인 모든 것들을 담당. UIKit O, 뷰모델 인스턴스만 갖고 있음.
class ViewController: UIViewController {
    @IBOutlet weak var numberTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    let numberViewModel = NumberViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 텍스트필드 액션 설정
        numberTextField.addTarget(self, action: #selector(numberTextFieldChanged), for: .editingChanged)
    }

    // 텍스트필드 값이 변경될 때
    @objc private func numberTextFieldChanged() {
        // 3000 -> 3,000 - 텍스트필드가 갖고있는 글자만 viewModel로 전달
        numberViewModel.inputText = numberTextField.text!
        resultLabel.text = numberViewModel.outputResult
    }
}

