//
//  CityListCoordinatorInput.swift
//  WeatherApp
//
//  Created by Anatoly Kustov on 14.08.2021.
//

import Foundation

protocol CityListCoordinatorInput: AnyObject {
	/// Была нажата кнопка добавления города
	func didTappedAddCityButton()
	/// Была нажата ячейка города
	/// - Parameters:
	///   - weather - погода
	func didTappedCityCellWith(weather: WeatherScheme)
}
