//
//  Breed.swift
//  Caturday
//
//  Created by Mommo Sadeghi on 19/09/23.
//

import Foundation



struct Breed: Codable, CustomStringConvertible {
    let id: String
    let name: String
    let temperament: String
    let breedExplaination: String
    let energyLevel: Int
    let isHairless: Bool
    let image: BreedImage
    
    var description: String {
        return "Breed with name: \(name), and ID \(id), energy level of \(energyLevel), is hairless \(isHairless ? "YES" : "NO")"
    }
    
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case temperament
        case breedExplaination = "description"
        case energyLevel = "energy-level"
        case isHairless = "hairless"
        case image
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try values.decode(String.self, forKey: .id)
        name = try values.decode(String.self, forKey: .name)
        temperament = try values.decode(String.self, forKey: .temperament)
        breedExplaination = try values.decode(String.self, forKey: .breedExplaination)
        energyLevel = try values.decode(Int.self, forKey: .energyLevel)
        let hairless = try values.decode(Int.self, forKey: .isHairless)
        isHairless = hairless == 1
        image = try values.decode(BreedImage.self, forKey: .image)
    }
    
    }



