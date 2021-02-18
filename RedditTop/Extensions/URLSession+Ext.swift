//
//  URLSession+Ext.swift
//  RedditTop
//
//  Created by Andy Orphan on 17.02.2021.
//

import Foundation

extension URLSession {
    func customCodableTask<T: Codable>(_ urlRequest: URLRequest, completion: @escaping (T?, URLResponse?, Error?) -> ()) -> URLSessionDataTask {
        return self.dataTask(with: urlRequest) { (data, response, error) in
            guard let data = data, error == nil else {
                DispatchQueue.main.async {
                    completion(nil, response, error)
                }
                return
            }
            let result = try? JSONDecoder().decode(T.self, from: data)
            DispatchQueue.main.async {
                completion(result, response, nil)
            }
        }
    }
}
