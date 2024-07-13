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
        HStack(spacing: 20) {
            AsyncImage(url: URL(string: country.flag.image)) { result in
                result.image?
                    .resizable()
                    .scaledToFit()
            }
            .frame(height: 100)
            Text(country.name.common)
            Spacer()
        }
        .padding()
    }
}

struct CountryRowView_Previews: PreviewProvider {
    static var previews: some View {
        CountryRowView(country: testCountriesData[0])
    }
}
