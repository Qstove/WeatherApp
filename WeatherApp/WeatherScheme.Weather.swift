//
//  WeatherScheme.Weather.swift
//  WeatherApp
//
//  Created by Anatoly Kustov on 14.08.2021.
//

extension WeatherScheme {
	struct Weather: Decodable {
		let id: Int?
		let main: String?
		let weatherDescription: String?
		let icon: String?
	}
}
