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
        
    }
    
    func fetchAllBreeds() {
        isLoading = true
        guard let url = URL(string: "https://api.thecatapi.com/v1/breeds?limit=50") else { return }
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            self?.isLoading = false
            let decoder = JSONDecoder()
            if let data = data {
                do {
                    let breeds = try decoder.decode([Breed].self, from: data)
                    self?.breeds = breeds
                    print(breeds)
                } catch {
                    print("data can not be decoded")
                }
            }
        }
        
    }
}
