//
//  DetailWeatherViewModel.swift
//  WeatherApp
//
//  Created by Anatoly Kustov on 14.08.2021.
//

struct DetailWeatherViewModel {
	/// Название города
	let cityName: String
	/// Температура
	let temperature: String
	/// Ощущается как (температура)
	let feelsLike: String
	/// Минимальная температура
	let tempMin: String
	/// Максимальная температура
	let tempMax: String
	/// Давление
	let pressure: String
}
