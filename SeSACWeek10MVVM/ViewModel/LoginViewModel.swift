//
//  LoginViewModel.swift
//  SeSACWeek10MVVM
//
//  Created by 조유진 on 2/23/24.
//

import Foundation

class LoginViewModel {
    var inputEmail = Observable("")
    var outputValidation = Observable("")
    
    var inputPassword = Observable("")
    var outputValidColor = Observable(false)

    init() {
        print("viewModel init")
        inputEmail.bind { value in
            print("email validation")
            self.validation(email: value, pw: self.inputPassword.value)
        }
        inputPassword.bind { value in
            print("pw validation")
            self.validation(email: self.inputEmail.value, pw: value)
        }
    }
    
    private func validation(email: String, pw: String) {    // 밖에서 볼 필요가 없다
        if email.count >= 3 && pw.count > 5{
            outputValidation.value = "\(email), \(pw)"
            outputValidColor.value = true
            
        } else {
            outputValidation.value = "이메일 3글자 이상, 비번 5자리 이상 입력해주세요"
            outputValidColor.value = false
        }
    }
}
