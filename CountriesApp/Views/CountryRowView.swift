//
//  CountryRowView.swift
//  CountriesApp
//
//  Created by Kim Nordin on 2024-07-13.
//

import SwiftUI

struct CountryRowView: View {
    let country: Country
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: country.flag.image))
            Text(country.name.common)
        }
    }
}

struct CountryRowView_Previews: PreviewProvider {
    static var previews: some View {
        CountryRowView(country: testCountriesData[0])
    }
}
