//
//  CityProviderInput.swift
//  WeatherApp
//
//  Created by Anatoly Kustov on 14.08.2021.
//

protocol CityProviderInput {
	/// Вернуть все города из Json,
	/// - Returns: все города  в формате [id: Название города]
	func getAllCities() -> [Dictionary<Int, String>.Element]
}
