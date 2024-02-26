//
//  UserViewModel.swift
//  SeSACWeek10MVVM
//
//  Created by 조유진 on 2/22/24.
//

import Foundation

// 비즈니스 로직만을 담당 - UIKit 필요없음
class UserViewModel {
    // Output
    var list: Observable<[User]> = Observable([])
    
    // 로드 버튼 클릭 시
    var inputFetchButtonClicked: Observable<Void?> = Observable(nil)     // 특정 액션을 input 프로퍼티로 만들어준다.
    // 전체 삭제 버튼 클릭 시
    var inputRemoveAllButtonClicked: Observable<Void?> = Observable(nil)
    
    // 추가 버튼 클릭 시 추가 키워드
    var inputAddText: Observable<String?> = Observable(nil)
    // 검색 버튼 클릭 시 검색 키워드
    var inputSearchText: Observable<String?> = Observable(nil)
    
    // 어떻게 해야 많은 개발자들과 똑같은 형태로 코드를 구현할 수 있을까? -> transform
    init() { transform() }
    
    private func transform() {
        fetchUser()
        inputFetchButtonClicked.bind { _ in
            self.fetchUser()
        }
        inputRemoveAllButtonClicked.bind { _ in
            self.removeAllUsers()
        }
        inputAddText.bind { text in
            self.appendUser(name: text)
        }
        inputSearchText.bind { text in
            self.searchUser(name: text)
        }
    }
    
    private func removeAllUsers() {
        list.value.removeAll()
    }
    
    private func fetchUser() {
        list.value = [
            User(name: "Hue", age: 23),
            User(name: "Jack", age: 21),
            User(name: "Bran", age: 22),
            User(name: "Den", age: 22)
        ]
    }
    
    private func searchUser(name: String?) {
        guard let name = name else { return }
        
        let result = list.value.filter { $0.name.contains(name) }
        list.value = result
    }
    
    // 입력받은 사용자를 list에 추가하기
    private func appendUser(name: String?) {
        // 옵셔널 바인딩
        guard let name = name else { return }
        
        // 중복 여부 확인
//        for item in list {
//            if item.name == name {
//                return      // 중복되면 그냥 끝내버리기
//            }
//        }
        let value = list.value.filter { $0.name == name }
        
        if value.count == 0 {
            let age = Int.random(in: 1...100)
            let user = User(name: name, age: age)
            list.value.append(user)
        }
    }
    
    var numberOfRowsInSection: Int {
        return list.value.count
    }
    
    func cellForRowAt(_ indexPath: IndexPath) -> User {
        return list.value[indexPath.row]
    }
}
