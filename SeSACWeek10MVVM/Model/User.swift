//
//  User.swift
//  SeSACWeek10MVVM
//
//  Created by 조유진 on 2/22/24.
//

import Foundation

// Model
struct User {
    let name: String
    let age: Int
}

class Food {
    private var closure: ((String) -> Void)?  // 클로저. 왜 옵셔널?
    
    var name: String {
        didSet {    // 초기화 시에는 실행 X
            print("didSet")
            closure?(name)
        }
    }
    
    init(_ name: String) {
        self.name = name
    }
    
    func test(_ closure: @escaping (String) -> Void) {
        closure(name)
        self.closure = closure
    }
}
