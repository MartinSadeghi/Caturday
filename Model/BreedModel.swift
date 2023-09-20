//
//  BreedModel.swift
//  Caturday
//
//  Created by Mommo Sadeghi on 20/09/23.
//

import Foundation

struct Breed : Codable, Identifiable {
//    let weight             : Weight?
    let id                 : String?
    let name               : String?
    let temperament        : String?
    let energy_level       : Int?
    let hairless           : Bool
    let image              : BreedImage?
    
    var description: String {
            return "breed with name: \(name ?? "") and id \(id ?? ""), energy level: \(energy_level ?? 0) isHairless: \(hairless ? "YES" : "NO")"
        }

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case name = "name"
        case temperament = "temperament"
        case energy_level = "energy_level"
        case hairless = "hairless"
        case image
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
//        weight = try values.decodeIfPresent(Weight.self, forKey: .weight)
        id = try values.decodeIfPresent(String.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        temperament = try values.decodeIfPresent(String.self, forKey: .temperament)
        energy_level = try values.decodeIfPresent(Int.self, forKey: .energy_level)
        let isHairless = try values.decodeIfPresent(Int.self, forKey: .hairless)
        hairless = isHairless == 1
        image = try values.decodeIfPresent(BreedImage.self, forKey: .image)
    }
    
    
    
    init(name: String, id: String, temperament: String,
         energyLevel: Int, hairless: Bool, image: BreedImage?) {
        self.name = name
        self.id = id
        self.temperament = temperament
        self.energy_level = energyLevel
        self.hairless = hairless
        self.image = image
    }
    
    
}
