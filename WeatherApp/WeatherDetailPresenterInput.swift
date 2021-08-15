//
//  WeatherDetailPresenterInput.swift
//  WeatherApp
//
//  Created by Anatoly Kustov on 14.08.2021.
//

protocol WeatherDetailPresenterInput {
	/// Передать в презентер детальную информацию о погоде
	/// - Parameter weather  детальная информация о погоде
	func presentDetailWeather(weather: WeatherScheme)
}
