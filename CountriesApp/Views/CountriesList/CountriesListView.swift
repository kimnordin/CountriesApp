//
//  CountriesListView.swift
//  CountriesApp
//
//  Created by Kim Nordin on 2024-07-13.
//

import SwiftUI

struct CountriesListView: View {
    @StateObject private var countriesViewModel = CountriesViewModel()
    @State private var searchInput: String = ""
    
    var body: some View {
        NavigationView {
            List {
                if let networkError = countriesViewModel.networkError {
                    VStack(alignment: .center, spacing: 8) {
                        Text("⚠️")
                            .font(.system(size: 40))
                        Text("No Available Countries")
                            .font(.system(size: 20))
                        let errorMessage = "Underlying Error: \(networkError.errorMessage)"
                        Text(errorMessage)
                            .font(.system(size: 14))
                            .frame(maxWidth: .infinity)
                            .multilineTextAlignment(.center)
                    }
                    .frame(maxWidth: .infinity)
                } else {
                    ForEach(countriesViewModel.countries) { country in
                        NavigationLink(destination: CountryDetailView(country: country)) {
                            CountryRowView(country: country)
                        }
                    }
                }
            }
        }
        .searchable(text: $searchInput)
        .onAppear {
            fetchAllCountries()
        }
        .onChange(of: searchInput) {
            if $0.isEmpty {
                fetchAllCountries()
            } else {
                searchCountries($0)
            }
        }
    }
    
    private func fetchAllCountries() {
        Task {
            await countriesViewModel.fetchAllCountries()
        }
    }
    
    private func searchCountries(_ input: String) {
        Task {
            await countriesViewModel.searchCountries(input)
        }
    }
}

struct CountriesListView_Previews: PreviewProvider {
    static var previews: some View {
        CountriesListView()
    }
}
