//
//  Observable.swift
//  SeSACWeek10MVVM
//
//  Created by 조유진 on 2/22/24.
//

import Foundation
// 실시간으로 달라지는 데이터를 감지


class Observable {
    var closure: (() -> Void)?
    
    var text: String {
        didSet {    // 내용이 달라질 때마다 어떤 기능
            closure?()   // 어떠한 함수를 실행
        }
    }
    
    init(text: String) {
        self.text = text
    }
    
    func bind(_ closure: @escaping () -> Void) {    // 매개변수로 함수를 넣어주고, closure라는 함수를 담는 프로퍼티에 넣어준다.
        print(#function)
        self.closure = closure
    }
}
