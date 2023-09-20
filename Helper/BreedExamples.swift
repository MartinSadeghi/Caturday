//
//  BreedExamples.swift
//  Caturday
//
//  Created by Mommo Sadeghi on 19/09/23.
//

import Foundation


class BreedExamples {
    
    static func example1() -> Breed {
        return Breed(name: "Abyssinian",
                     id: "abys",
                     temperament: "Active, Energetic, Independent, Intelligent, Gentle",
                     energyLevel: 5,
                     hairless: false,
                     image: BreedImage(height: 100, id: "i", url: "https://cdn2.thecatapi.com/images/unX21IBVB.jpg", width: 100))
        
    }
    
    static func example2() -> Breed {
        return Breed(name: "Persian",
                     id: "absdys",
                     temperament: "Active, Energetic, Independent, Intelligent, Gentle",
                     energyLevel: 9,
                     hairless: false,
                     image: BreedImage(height: 100,
                                       id: "dded",
                                       url: "https://cdn2.thecatapi.com/images/unX21IBVB.jpg",
                                       width: 99))
    }
}
