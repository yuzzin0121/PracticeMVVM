//
//  NetworkViewModel.swift
//  SeSACWeek10MVVM
//
//  Created by 조유진 on 2/26/24.
//

import Foundation
import Alamofire

class NetworkViewModel {
    var outputMarketData: Observable<[Market]> = Observable([])
    var outputLabelData = Observable("")
    var inputViewDidLoadTrigger: Observable<Void?> = Observable(nil)
    
    init() {
        transform()
    }
    
    private func transform() {
        inputViewDidLoadTrigger.bind { _ in
            self.callRequest()
        }
    }
    
    private func callRequest() {
        let url = "https://api.upbit.com/v1/market/all"
        AF.request(url).responseDecodable(of: [Market].self) { response in
            switch response.result {
            case .success(let success):
                self.outputMarketData.value = success
                self.outputLabelData.value = success[0].korean_name
            case .failure(let failure):
                print(failure)
            }
        }
    }
    
    func numberOfRowsInSection() -> Int {
        return outputMarketData.value.count
    }
    
    func cellForRowAt(_ indexPath: IndexPath) -> Market {
        return outputMarketData.value[indexPath.row]
    }
}
