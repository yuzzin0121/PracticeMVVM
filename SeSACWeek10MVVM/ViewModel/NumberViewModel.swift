//
//  NumberViewModel.swift
//  SeSACWeek10MVVM
//
//  Created by 조유진 on 2/22/24.
//

import Foundation

class NumberViewModel {
    var inputText = "" {
        didSet {
            validation()
            print("==", oldValue, outputResult)
        }
    }
    var outputResult = "" {
        didSet {
            // 뷰 레이블 내용 보여주기
        }
    }
    
    // 데이터 가공
    private func validation() {
        let text = inputText
        
        // 1. 빈값
        if text.isEmpty {
            outputResult = "값을 입력해주세요"
        }
        
        // 2. 문자열이 숫자인지 문자인지 체크
        guard let num = Int(text) else {
            outputResult = "숫자만 입력해주세요"
            return
        }
        
        // 3. 숫자에 쉼표.(음수X, 100만 이하) 찍어주기
        if num > 0, num <= 1000000 {
            let formatter = NumberFormatter()
            formatter.numberStyle = .decimal
            let result = formatter.string(for: num)
            outputResult = result!
        } else {
            outputResult = "100만원 이하로 입력해주세요."
        }
    }
}
