//
//  CountryFlag.swift
//  CountriesApp
//
//  Created by Kim Nordin on 2024-07-13.
//

import Foundation

struct CountryFlag: Codable {
    let image: String
    
    enum CodingKeys: String, CodingKey {
        case image = "png"
    }
}
