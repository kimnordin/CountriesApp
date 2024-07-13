//
//  CountryDetailView.swift
//  CountriesApp
//
//  Created by Kim Nordin on 2024-07-13.
//

import SwiftUI

struct CountryDetailView: View {
    let country: Country
    
    var body: some View {
        ScrollView {
            VStack {
                AsyncImage(url: URL(string: country.flag.image)) { result in
                    result.image?
                        .resizable()
                        .scaledToFit()
                }
                Text("Name")
                    .titleView()
                Text(country.name.common)
                if let capitals = country.capitals {
                    let capitalTitle = capitals.count > 1 ? "Capitals" : "Capital"
                    Text(capitalTitle)
                        .titleView()
                    ForEach(capitals, id: \.self) { capital in
                        Text(capital)
                    }
                }
                Text("Population")
                    .titleView()
                Text("\(country.population)")
                Spacer()
            }
        }
        .navigationTitle(country.name.common)
        .navigationBarTitleDisplayMode(.large)
    }
}

struct CountryDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CountryDetailView(country: testCountriesData[0])
    }
}
