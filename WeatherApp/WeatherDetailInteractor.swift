//
//  WeatherDetailInteractor.swift
//  WeatherApp
//
//  Created by Anatoly Kustov on 14.08.2021.
//

final class WeatherDetailInteractor {
	var presenter: WeatherDetailPresenterInput?
	private let cityWeatherData: WeatherScheme

	init(cityWeather: WeatherScheme) {
		cityWeatherData = cityWeather
	}
}

extension WeatherDetailInteractor: WeatherDetailInteractorInput {
	func start() {
		presenter?.presentDetailWeather(weather: cityWeatherData)
	}
}
