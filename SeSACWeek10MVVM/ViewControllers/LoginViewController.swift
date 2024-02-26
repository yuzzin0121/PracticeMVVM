//
//  LoginViewController.swift
//  SeSACWeek10MVVM
//
//  Created by 조유진 on 2/23/24.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var pwField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
   
    
    let loginViewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        emailField.text = loginViewModel.inputEmail.value
        pwField.text = loginViewModel.inputPassword.value
        
        
        loginViewModel.outputValidation.bind { value in
            self.resultLabel.text = value
        }
        loginViewModel.outputValidColor.bind { value in
            self.resultLabel.textColor = value ? .green : .red
        }
        
        emailField.addTarget(self, action: #selector(emailChanged), for: .editingChanged)
        pwField.addTarget(self, action: #selector(pwChanged), for: .editingChanged)
    }
    
    @objc private func emailChanged() {
        guard let text = emailField.text else { return }
        loginViewModel.inputEmail.value = text
    }

    @objc private func pwChanged() {
        guard let text = pwField.text else { return }
        loginViewModel.inputPassword.value = text
    }
}
