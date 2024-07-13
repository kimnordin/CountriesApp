//
//  NetworkManager.swift
//  CountriesApp
//
//  Created by Kim Nordin on 2024-07-13.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case decodingError(String)
}

struct NetworkManager {
    private let countriesUrl = "https://restcountries.com/v3.1/all"
    
    func fetchCountries() async throws -> [Country] {
        guard let url = URL(string: countriesUrl) else { throw NetworkError.invalidURL }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            guard let countries = try? JSONDecoder().decode([Country].self, from: data) else { throw NetworkError.decodingError("Failed Decoding Countries") }
            return countries
        } catch {
            throw error
        }
    }
}
