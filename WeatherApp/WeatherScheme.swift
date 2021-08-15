//
//  WeatherScheme.swift
//  WeatherApp
//
//  Created by Anatoly Kustov on 14.08.2021.
//

struct WeatherScheme: Decodable {
	let coord: CityScheme.Coord?
	let weather: [Weather]?
	let base: String?
	let main: Main?
	let visibility: Int?
	let wind: Wind?
	let clouds: Clouds?
	let dt: Int?
	let sys: Sys?
	let timezone: Int?
	let id: Int?
	let name: String?
	let cod: Int?
}
