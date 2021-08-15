//
//  WeatherScheme.Wind.swift
//  WeatherApp
//
//  Created by Anatoly Kustov on 14.08.2021.
//

extension WeatherScheme {
	struct Wind: Decodable {
		let speed: Double?
		let deg: Int?
	}
}
