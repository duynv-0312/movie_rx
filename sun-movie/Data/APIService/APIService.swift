//
//  APIService.swift
//  sun-movie
//
//  Created by Duy Nguyễn on 26/04/2024.
//

import Foundation
import Alamofire
import ObjectMapper

enum AppError: Error {
    case noInternet
    case normalError(String)
    
    var description: String {
        switch self {
        case .noInternet:
            return "No internet connection."
        case .normalError(let message):
            return message
        }
    }
}

class APIService {
    static let shared = APIService()
    let cache = NSCache<NSString, UIImage>()
    private init() {}
    
    func get<T: Mappable>(urlString: String, completion: @escaping((Result<T, Error>) -> Void)) {
        guard NetWorkMonitor.shared.isConnected else {
            completion(.failure(AppError.noInternet))
            return
        }
        
        guard let url = URL(string: urlString) else {
            completion(.failure(AppError.normalError("Invalid URL")))
            return
        }
        
        AF.request(urlString).responseData { response in
            switch response.result {
            case .success(let data):
                do {
                    guard let jsonObject = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else {
                        completion(.failure(AppError.normalError("Failed to parse JSON")))
                        return
                    }
                    if let movie = Mapper<T>().map(JSON: jsonObject) {
                        completion(.success(movie))
                    } else {
                        completion(.failure(AppError.normalError("Failed to map JSON")))
                    }
                } catch {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
