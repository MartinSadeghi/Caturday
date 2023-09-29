//
//  BreedFetcher.swift
//  Caturday
//
//  Created by Mommo Sadeghi on 19/09/23.
//

import Foundation


class BreedFetcher: ObservableObject {
    
    @Published var breeds = [Breed]()
    @Published var errorMessage: String? = nil
    @Published var isLoading = false
    
    init() {
        fetchAllBreeds()
    }
    
    
    func fetchAllBreeds() {
        isLoading = true
        errorMessage = nil
        let apiService = APIService()
        guard let url = URL(string:Constanat.APIKEY) else { return }
        apiService.fetchBreeds(url: url) { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .success(let breeds):
                    self?.breeds = breeds
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                }
            }
        }
        
        
    }
    
    static func errorState() -> BreedFetcher {
        let fetcher = BreedFetcher()
        fetcher.errorMessage = APIError.urlError(URLError.init(.notConnectedToInternet)).localizedDescription
        return fetcher
    }
    
    static func successState() -> BreedFetcher {
        let fetcher = BreedFetcher()
        fetcher.breeds = [BreedExamples.example1(), BreedExamples.example2()]
        return fetcher
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
