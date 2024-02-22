//
//  UserViewModel.swift
//  SeSACWeek10MVVM
//
//  Created by 조유진 on 2/22/24.
//

import Foundation

// 비즈니스 로직만을 담당 - UIKit 필요없음
class UserViewModel {
    var list = [User(name: "Hue", age: 23),
                User(name: "Jack", age: 21),
                User(name: "Bran", age: 22),
                User(name: "Den", age: 22)
    ]
    
    var numberOfRowsInSection: Int {
        return list.count
    }
    
    func cellForRowAt(_ indexPath: IndexPath) -> User {
        return list[indexPath.row]
    }
}
