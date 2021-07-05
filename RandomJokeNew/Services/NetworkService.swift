//
//  NetworkService.swift
//  RandomJokeNew
//
//  Created by Vlad Vinogrotskiy on 02.07.2021.
//

import UIKit
import Alamofire

class NetworkService {

    static let shared = NetworkService()

    func getJoke (for urlStr: String, completionHandler: @escaping (RandomJoke?, String?) -> Void) {
        
        AF.request(urlStr)
            .validate()
            .responseDecodable(of: RandomJoke.self) { response in
            switch response.result {
            case .failure(let error):
                completionHandler(nil, error.localizedDescription)
            case .success(let result):
                completionHandler(result, nil)
            }
        }
    }
}
