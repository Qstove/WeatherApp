//
//  WeatherScheme.Sys.swift
//  WeatherApp
//
//  Created by Anatoly Kustov on 14.08.2021.
//

extension WeatherScheme {
	struct Sys: Decodable {
		let type: Int?
		let id: Int?
		let message: Double?
		let country: String?
		let sunrise: Int?
		let sunset: Int?
	}
}
