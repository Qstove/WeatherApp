//
//  Coord.swift
//  WeatherApp
//
//  Created by Anatoly Kustov on 14.08.2021.
//

extension CityScheme {
	/// Структура, описывающая координаты
	struct Coord: Decodable {
		/// Долгота
		let lon: Double
		/// Широта
		let lat: Double
	}
}
