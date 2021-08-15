//
//  WeatherScheme.Main.swift
//  WeatherApp
//
//  Created by Anatoly Kustov on 14.08.2021.
//

extension WeatherScheme {
	/// Основная информация по погоде
	struct Main: Decodable {
		/// Температура
		let temp: Double?
		/// Чувствуется как
		let feelsLike: Double?
		/// Минимальная температура
		let tempMin: Double?
		/// Максимальная температура
		let tempMax: Double?
		/// Давление
		let pressure: Int?
		/// Влажность
		let humidity: Int?

		enum CodingKeys: String, CodingKey {
			case temp = "temp"
			case feelsLike = "feels_like"
			case tempMin = "temp_min"
			case tempMax = "temp_max"
			case pressure = "pressure"
			case humidity = "humidity"
		}
	}
}
