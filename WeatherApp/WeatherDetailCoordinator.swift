//
//  WeatherDetailCoordinator.swift
//  WeatherApp
//
//  Created by Anatoly Kustov on 14.08.2021.
//

final class WeatherDetailCoordinator {
	/// Оутпут координатора флоу делальной информации
	var output: WeatherDetailCoordinatorOutput?
	private let router: Router

	/// Инициализация координатора флоу детальной информации
	/// - Parameters:
	///    - router: роутер
	init(router: Router) {
		self.router = router
	}

	/// Старт флоу
	func startWith(weather: WeatherScheme) {
		showWeatherDetailWith(weather: weather)
	}

	private func showWeatherDetailWith(weather: WeatherScheme) {
		let weatherDetailVC = WeatherDetailAssembly()
			.createModule(coordinator: self,
						  weather: weather)
		router.push(weatherDetailVC, animated: true)
	}
}

extension WeatherDetailCoordinator: WeatherDetailCoordinatorInput {
	func finishWeatherDetailFlow() {
		output?.weatherDetailFlowFinished()
	}
}
