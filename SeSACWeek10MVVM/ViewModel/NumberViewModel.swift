//
//  NumberViewModel.swift
//  SeSACWeek10MVVM
//
//  Created by 조유진 on 2/22/24.
//

import Foundation

class NumberViewModel {
    var inputText = Observable("")
    
    var outputResult = Observable("")
    
    init() {    // 초기화할 때 inputText의 값이 바뀔 때 마다 어떤 기능을 실행할 것인지 설정
        inputText.bind { value in
            self.validation(value)
        }
    }
    
    // 데이터 가공
    private func validation(_ text: String) {
        
        // 1. 빈값
        if text.isEmpty {
            outputResult.value = "값을 입력해주세요"
        }
        
        // 2. 문자열이 숫자인지 문자인지 체크
        guard let num = Int(text) else {
            outputResult.value = "숫자만 입력해주세요"
            return
        }
        
        // 3. 숫자에 쉼표.(음수X, 100만 이하) 찍어주기
        if num > 0, num <= 1000000 {
            let formatter = NumberFormatter()
            formatter.numberStyle = .decimal
            let result = formatter.string(for: num)
            outputResult.value = result!
        } else {
            outputResult.value = "100만원 이하로 입력해주세요."
        }
    }
}
