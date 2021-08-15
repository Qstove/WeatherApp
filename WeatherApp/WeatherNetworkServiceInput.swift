//
//  WeatherNetworkServiceInput.swift
//  WeatherApp
//
//  Created by Anatoly Kustov on 14.08.2021.
//

import Foundation

protocol WeatherNetworkServiceInput {
	/// Получить погоду для одного города
	/// - Parameters:
	///   - id: id города
	///   - completion: комплишн
	func getWeatherForCityWith(id: Int, completion: @escaping (WeatherScheme?) -> Void)

	/// Получить погоду для нескольких городов
	/// - Parameters:
	///   - id: id городов
	///   - completion: комплишн
	func getWeatherForCitiesWith(ids: [Int],
								 completion: @escaping ([WeatherScheme]?) -> Void)
}
