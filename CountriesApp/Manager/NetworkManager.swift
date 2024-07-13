//
//  NetworkManager.swift
//  CountriesApp
//
//  Created by Kim Nordin on 2024-07-13.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case decodingError
    case unexpectedError
    
    var errorMessage: String {
        switch self {
        case .invalidURL:
            return "Invalid URL"
        case .decodingError:
            return "Failed Decoding Countries"
        case .unexpectedError:
            return "Unexpected Error Occured"
        }
    }
}

struct NetworkManager {
    private let countriesBaseUrl = "https://restcountries.com/v3.1"
    private let filteredFields = "fields=name,capital,population,flags"
    
    func fetchAllCountries() async throws -> [Country] {
        let allCountriesUrl = "\(countriesBaseUrl)/all?\(filteredFields)"
        guard let url = URL(string: allCountriesUrl) else { throw NetworkError.invalidURL }
        return try await fetchAndDecodeCountries(from: url)
    }
    
    func searchCountries(_ input: String) async throws -> [Country] {
        let searchCountriesUrl = "\(countriesBaseUrl)/name/\(input)?\(filteredFields)"
        guard let url = URL(string: searchCountriesUrl) else { throw NetworkError.invalidURL }
        
        return try await fetchAndDecodeCountries(from: url)
    }
    
    private func fetchAndDecodeCountries(from url: URL) async throws -> [Country] {
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            guard let countries = try? JSONDecoder().decode([Country].self, from: data) else { throw NetworkError.decodingError }
            return countries
        } catch {
            throw error
        }
    }
}
