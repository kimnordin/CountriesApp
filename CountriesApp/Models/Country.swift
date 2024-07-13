//
//  Country.swift
//  CountriesApp
//
//  Created by Kim Nordin on 2024-07-13.
//

import SwiftUI

struct Country: Identifiable {
    let id = UUID()
    let name: String
    let capital: String
    let population: String
    let flag: String
}

#if DEBUG
let testCountriesData = [
    Country(name: "Sweden", capital: "Stockholm", population: "10000000", flag: "https://flagcdn.com/w320/se.png"),
    Country(name: "France", capital: "Paris", population: "68000000", flag: "https://flagcdn.com/w320/fr.png")
]
#endif
