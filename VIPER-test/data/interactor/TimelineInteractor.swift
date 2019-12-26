//
//  TimelineInteractor.swift
//  VIPER-test
//
//  Created by 辻 悠一郎 on 2019/12/20.
//  Copyright © 2019 辻 悠一郎. All rights reserved.
//

import Foundation
import Alamofire

protocol TimelineInteractorProtocol {
    func fetchTimeline(completion: @escaping (Swift.Result<[TimelineEntity], Error>) -> Void)
}

class TimelineInteractor: TimelineInteractorProtocol {
    
    // Todo: テストできるように、ここでAPIClientをinitする
    //    private let client: QiitaAPIClientProtocol
    //
    //    init(client: QiitaAPIClientProtocol = QiitaAPIClient()) {
    //        self.client = client
    //    }
    
    func fetchTimeline(completion: @escaping (Swift.Result<[TimelineEntity], Error>) -> Void) {
        
        let url = "https://qiita.com/api/v2/items?per_page=10"
        
        Alamofire.request(url, method: .get, encoding: JSONEncoding.default).responseJSON { response in
            guard let data = response.data else { return }
            let decoder = JSONDecoder()
            do {
                let entities: [TimelineEntity] = try decoder.decode([TimelineEntity].self, from: data)
                completion(.success(entities))
            } catch {
                completion(.failure(error))
            }
        }
    }
}
