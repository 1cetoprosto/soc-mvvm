//
//  URLSession+Extension.swift
//  soc
//
//  Created by Леонід Квіт on 04.02.2022.
//

import Foundation

// MARK: - URLSession response handlers

extension URLSession {
//    fileprivate func codableTask<T: Codable>(with url: URL, completionHandler: @escaping (T?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
//        let api = API()
//        let headers = [
//            "x-rapidapi-host": api.host,
//            "x-rapidapi-key": api.key
//        ]
//
//        let request = NSMutableURLRequest(url: url,
//                                          cachePolicy: .useProtocolCachePolicy,
//                                          timeoutInterval: 10.0)
//
////        var request = URLRequest(url: url,
////                                          cachePolicy: .useProtocolCachePolicy,
////                                          timeoutInterval: 10.0)
//
//        request.httpMethod = "GET"
//        request.allHTTPHeaderFields = headers
//
//        let networkService = NetworkService()
//
//        return self.dataTask(with: request as URLRequest) { data, response, error in
//            guard let data = data, error == nil else {
//                print("Не получили data и есть error \(String(describing: error))")
//                completionHandler(nil, response, error)
//                       return
//            }
//            DispatchQueue.main.async {
//                completionHandler(try? networkService.newJSONDecoder().decode(T.self, from: data), response, nil)
//            }
//        }
//    }
//    
//    func socTask(with url: URL, completionHandler: @escaping (Soc?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
//        return self.codableTask(with: url, completionHandler: completionHandler)
//    }
}
