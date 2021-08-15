//
//  City.swift
//  WeatherApp
//
//  Created by Anatoly Kustov on 14.08.2021.
//

/// Структура, описывающая город
struct CityScheme: Decodable {
	/// id
	let id: Int
	/// Название города
	let name: String
	/// Штат (не для всех)
	let state: String?
	/// Страна
	let country: String
	/// Координаты
	let coord: Coord
}
