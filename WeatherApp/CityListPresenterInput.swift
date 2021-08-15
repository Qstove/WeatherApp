//
//  CityListPresenterInput.swift
//  WeatherApp
//
//  Created by Anatoly Kustov on 14.08.2021.
//

protocol CityListPresenterInput: AnyObject {
	func presentSavedCities(with data: [WeatherScheme])
	func presentLoading()
	func presentEmptySavedCityList()
}
