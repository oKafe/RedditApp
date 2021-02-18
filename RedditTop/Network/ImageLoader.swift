//
//  ImageLoader.swift
//  RedditTop
//
//  Created by Andy Orphan on 17.02.2021.
//

import Foundation
import UIKit

class ImageLoaderSingleton {
    
    static let shared = ImageLoaderSingleton()

    private let imageLoader = ImageLoader()
    private var tasksIds = [UIImageView: UUID]()

    private init() {}
    
    func load(_ urlString: String, for imageView: UIImageView) {
        guard let url = URL(string: urlString) else {
            return
        }
        let token = imageLoader.load(url) { result in
            defer {
                self.tasksIds.removeValue(forKey: imageView)
            }
            DispatchQueue.main.async {
                imageView.image = result
            }
        }
        if let token = token {
            tasksIds[imageView] = token
        }
    }

    func cancel(for imageView: UIImageView) {
        if let uuid = tasksIds[imageView] {
            imageLoader.cancel(uuid)
            tasksIds.removeValue(forKey: imageView)
        }
    }
    
    func clearCache() {
        imageLoader.clearCache()
    }
    
}

class ImageLoader {
    
    private var requests = [UUID: URLSessionDataTask]()
    private var cache = [URL: UIImage]()
    
    func clearCache() {
        cache = [URL: UIImage]()
    }
    
    func load(_ url: URL, _ completion: @escaping (UIImage?) -> Void) -> UUID? {

        if let image = cache[url] {
            completion(image)
            return nil
        }

        let uuid = UUID()

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            defer { self.requests.removeValue(forKey: uuid) }
            if let data = data, let image = UIImage(data: data) {
                self.cache[url] = image
                completion(image)
                return
            }
        }
        
        task.resume()

        requests[uuid] = task
        return uuid
    }
    
    func cancel(_ uuid: UUID) {
        requests[uuid]?.cancel()
        requests.removeValue(forKey: uuid)
    }
    
}
