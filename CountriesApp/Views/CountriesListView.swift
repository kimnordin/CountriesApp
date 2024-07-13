//
//  CountriesListView.swift
//  CountriesApp
//
//  Created by Kim Nordin on 2024-07-13.
//

import SwiftUI

struct CountriesListView: View {
    @State private var countries: [Country] = []
    
    var body: some View {
        List {
            ForEach(countries) { country in
                CountryRowView(country: country)
            }
        }
        .onAppear {
            for testCountry in testCountriesData {
                countries.append(testCountry)
            }
        }
    }
}

struct CountriesListView_Previews: PreviewProvider {
    static var previews: some View {
        CountriesListView()
    }
}
