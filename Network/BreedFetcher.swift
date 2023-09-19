//
//  BreedFetcher.swift
//  Caturday
//
//  Created by Mommo Sadeghi on 19/09/23.
//

import Foundation


class BreedFetcher: ObservableObject {
    
    var breeds = [Breed]()
    var errorMessage: String? = nil
    var isLoading = false
    
    init() {
        fetchAllBreeds()
    }
    
//    func fetchAllBreeds() {
//        isLoading = true
//        guard let url = URL(string: "https://api.thecatapi.com/v1/breeds?limit=10") else { return errorMessage = APIError.badURLError.localizedDescription }
//        let task = URLSession.shared.dataTask(with: url) { [weak self] data, res, err in
//            self?.isLoading = false
//            if let response = res as? HTTPURLResponse, !(200...299).contains(response.statusCode) {
//                // show Error
//            }
//            let decoder = JSONDecoder()
//            if let data = data {
//                do {
//                    let breeds = try decoder.decode([Breed].self, from: data)
//                    DispatchQueue.main.async {
//                        self?.breeds = breeds
//                    }
//                    print(breeds)
//                } catch {
//                    print("data can not be decoded")
//                }
//            }
//        }
//        task.resume()
//    }
}
