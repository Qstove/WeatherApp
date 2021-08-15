//
//  WeatherSchemeMultiple.swift
//  WeatherApp
//
//  Created by Anatoly Kustov on 14.08.2021.
//

import Foundation

struct WeatherSchemeMultiple: Decodable {
	/// Число объектов
	let cnt: Int?
	/// Список объектов
	let list: [WeatherScheme]?
}
