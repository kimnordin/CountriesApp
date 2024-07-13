//
//  CountriesViewModel.swift
//  CountriesApp
//
//  Created by Kim Nordin on 2024-07-13.
//

import Foundation

class CountriesViewModel: ObservableObject {
    private let networkManager = NetworkManager()
    @Published var countries: [Country] = []
    @Published var networkError: NetworkError? = nil
    
    /// Returns all available Countries.
    @MainActor func fetchAllCountries() async {
        do {
            countries = try await networkManager.fetchAllCountries()
            networkError = nil
        } catch {
            networkError = outputNetworkError(error)
        }
    }
    
    /**
     Returns a filtered array of Countries whose name matches some searchable input.
     - parameter input: The string to filter the Countires by.
     */
    @MainActor func searchCountries(_ input: String) async {
        do {
            countries = try await networkManager.searchCountries(input)
            networkError = nil
        } catch {
            networkError = outputNetworkError(error)
        }
    }
    
    private func outputNetworkError(_ error: Error) -> NetworkError {
        guard let networkError = error as? NetworkError else { return NetworkError.unexpectedError }
        return networkError
    }
}
