# Countries App
SwiftUI App that utilizes the https://restcountries.com/ API to display countries and their related information.

## Features
The CountriesApp displays a searchable list of countries with each row featuring the flag and name of the country.  
Each row conforms to a Detail View which displays additional information of each country.

The App relies on the following API Endpoints:
- [https://restcountries.com/v3.1/all](https://restcountries.com/v3.1/all) - To fetch the complete list of countries
- [https://restcountries.com/v3.1/all?fields={[field]}](https://restcountries.com/v3.1/all?fields=name,capital,population,flags) - To only fetch the necessary fields of the countries response
- [https://restcountries.comv/3.1/name/{name}](https://restcountries.com/v3.1/name/sweden) - To perform country searches through matching names

## Structure
The App follows a quite familiar MVVM approach.  
This allows us to differentiate between our business- and view logic.

The Apps MVVM pattern can be described as follows:
- Models - Blueprints representing the Apps data and business logic.
- Views - Displays the current State of the App by observing the ViewModel. Any business logic updates are dispatched to the ViewModel, which is triggered on user interactions.
- ViewModels - Facilitate communication between Views and Models, notify the View of any state changes through @Published variables, and perform any necessary logic upon user interactions from the View.

The App is mainly segmented into three different groups (excluding the [NetworkManager](https://github.com/kimnordin/CountriesApp/blob/master/CountriesApp/Manager/NetworkManager.swift))
- Models
  - [Country](https://github.com/kimnordin/CountriesApp/blob/master/CountriesApp/Models/Country.swift)
  - [CountryName](https://github.com/kimnordin/CountriesApp/blob/master/CountriesApp/Models/CountrySubModels/CountryName.swift)
  - [CountryFlag](https://github.com/kimnordin/CountriesApp/blob/master/CountriesApp/Models/CountrySubModels/CountryFlag.swift)
- Views
  - [CountriesListView](https://github.com/kimnordin/CountriesApp/blob/master/CountriesApp/Views/CountriesList/CountriesListView.swift)
  - [CountryRowView](https://github.com/kimnordin/CountriesApp/blob/master/CountriesApp/Views/CountriesList/CountryRowView.swift)
  - [CountryDetailView](https://github.com/kimnordin/CountriesApp/blob/master/CountriesApp/Views/CountryDetail/CountryDetailView.swift)
- ViewModels
  - [CountriesViewModel](https://github.com/kimnordin/CountriesApp/blob/master/CountriesApp/ViewModels/CountriesViewModel.swift)
