//
//  CountriesListView.swift
//  CountriesApp
//
//  Created by Kim Nordin on 2024-07-13.
//

import SwiftUI

struct CountriesListView: View {
    @StateObject private var countriesViewModel = CountriesViewModel()
    
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
        .onAppear {
            fetchAllCountries()
        }
    }
    
    private func fetchAllCountries() {
        Task {
            await countriesViewModel.fetchAllCountries()
        }
    }
}

struct CountriesListView_Previews: PreviewProvider {
    static var previews: some View {
        CountriesListView()
    }
}
