//
//  Country.swift
//  CountriesApp
//
//  Created by Kim Nordin on 2024-07-13.
//

import Foundation

struct Country: Codable, Identifiable {
    let id = UUID()
    let name: CountryName
    let capitals: [String]?
    let population: Int
    let flag: CountryFlag
    
    enum CodingKeys: String, CodingKey {
        case name
        case capitals = "capital"
        case population
        case flag = "flags"
    }
}

#if DEBUG
let testCountriesData = [
    Country(name: CountryName(common: "Sweden"), capitals: ["Stockholm"], population: 10000000, flag: CountryFlag(image: "https://flagcdn.com/w320/se.png")),
    Country(name: CountryName(common: "France"), capitals: ["Paris"], population: 68000000, flag: CountryFlag(image: "https://flagcdn.com/w320/fr.png"))
]
#endif
