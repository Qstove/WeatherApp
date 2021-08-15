//
//  CitySearchCoordinatorInput.swift
//  WeatherApp
//
//  Created by Anatoly Kustov on 14.08.2021.
//

protocol CitySearchCoordinatorInput: AnyObject {
	/// Была нажата кнопка закрытия
	func didTappedCloseCityButton()

	/// Была нажата ячейка города
	/// - Parameters:
	///   - name: название города
	///   - id: id города
	func didTappedCityCellWith(city name: String,
							   id: Int)
}

