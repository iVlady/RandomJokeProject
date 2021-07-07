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

    var jokeCache = NSCache<NSString, AnyObject>()
    
    func fetchJoke (for url: String, completionHandler: @escaping (RandomJoke?, String?) -> Void) {
        
        AF.request(url)
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
//    func getJoke (url: URL, completionHandler: @escaping (Data, URLResponse) -> Void) {
//        URLSession.shared.dataTask(with: url) { data, response, error in
//            guard let data = data, let response = response else {
//                print(error?.localizedDescription ?? "Unknown Error")
//                return
//            }
//            guard url == response.url else { return }
//            completionHandler(data, response)
//        }.resume()
//    }



//        guard let url = URL(string: url) else { return }
//        URLSession.shared.dataTask(with: url) { data, response, error in
//            guard let data = data else { return }
//            do {
//                let randomJoke = try JSONDecoder().decode(RandomJoke.self, from: data)
//                print(randomJoke)
//            } catch let error {
//                print(error.localizedDescription)
//            }
//
//
//        }.resume()
