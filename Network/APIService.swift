//
//  APIService.swift
//  Caturday
//
//  Created by Mommo Sadeghi on 19/09/23.
//

import Foundation


struct APIService {
    
    
    func fetch<T: Decodable>(_ type: T.Type, url: URL?, completion: @escaping (Result<T, APIError>) -> ()) {
        guard let url = url else {
             let error = APIError.badURLError
            completion(Result.failure(error))
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, res, err in
            if let error = err as? URLError {
                completion(Result.failure(APIError.urlError(error)))
            } else if let response = res as? HTTPURLResponse, !(200...299).contains(response.statusCode) {
                // show Error
                completion(Result.failure(APIError.badResponseError(statusCode: response.statusCode)))
            } else if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let results = try decoder.decode(type.self, from: data)
                    completion(Result.success(results))
                    print(results)
                } catch {
                    completion(Result.failure(APIError.parsingError(err as? DecodingError)))
                    print("data can not be decoded")
                }
            }
        }
        task.resume()
    }
    
    func fetchBreeds(url: URL?, completion: @escaping (Result<[Breed], APIError>) -> ()) {
        guard let url = url else {
             let error = APIError.badURLError
            completion(Result.failure(error))
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, res, err in
            if let error = err as? URLError {
                completion(Result.failure(APIError.urlError(error)))
            } else if let response = res as? HTTPURLResponse, !(200...299).contains(response.statusCode) {
                // show Error
                completion(Result.failure(APIError.badResponseError(statusCode: response.statusCode)))
            } else if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let breeds = try decoder.decode([Breed].self, from: data)
                    completion(Result.success(breeds))
                    print(breeds)
                } catch {
                    completion(Result.failure(APIError.parsingError(err as? DecodingError)))
                    print("data can not be decoded")
                }
            }
        }
        task.resume()

    }
}
