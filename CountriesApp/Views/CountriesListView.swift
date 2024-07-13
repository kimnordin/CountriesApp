//
//  CountriesListView.swift
//  CountriesApp
//
//  Created by Kim Nordin on 2024-07-13.
//

import SwiftUI

struct CountriesListView: View {
    private let networkManager = NetworkManager()
    @State private var countries: [Country] = []
    
    var body: some View {
        List {
            ForEach(countries) { country in
                CountryRowView(country: country)
            }
        }
        .onAppear {
            Task {
                do {
                    countries = try await NetworkManager().fetchCountries()
                } catch let error as NetworkError {
                    switch error {
                    case .invalidURL:
                        print("Invalid URL")
                    case .decodingError(let message):
                        print("Decoding Error: ", message)
                    }
                } catch {
                    print("An unexpected Error occurred: ", error)
                }
            }
        }
    }
}

struct CountriesListView_Previews: PreviewProvider {
    static var previews: some View {
        CountriesListView()
    }
}
