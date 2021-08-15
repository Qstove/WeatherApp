//
//  WeatherDetailPresenter.swift
//  WeatherApp
//
//  Created by Anatoly Kustov on 14.08.2021.
//

final class WeatherDetailPresenter {
	/// ViewController
	weak var viewController: WeatherDetailViewInput?
}

extension WeatherDetailPresenter: WeatherDetailPresenterInput {
	func presentDetailWeather(weather: WeatherScheme) {
		let viewModel = DetailWeatherViewModel(cityName: weather.name ?? "",
											   temperature: String(weather.main?.temp ?? 0.0),
											   feelsLike: String(weather.main?.feelsLike ?? 0.0),
											   tempMin: String(weather.main?.tempMin ?? 0.0),
											   tempMax: String(weather.main?.tempMax ?? 0.0),
											   pressure: String(weather.main?.pressure ?? 0))
		viewController?.displayDetailInfo(viewModel: viewModel)
	}
}
