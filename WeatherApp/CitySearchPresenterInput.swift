//
//  CitySearchPresenterInput.swift
//  WeatherApp
//
//  Created by Anatoly Kustov on 14.08.2021.
//

protocol CitySearchPresenterInput: AnyObject {
	/// Передать в презентер город
	/// - Parameters:
	///   - cityDictElements - города
	func presentCityListWith(cityDictElements: [Dictionary<Int, String>.Element])
}
