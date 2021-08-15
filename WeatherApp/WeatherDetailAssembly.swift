//
//  WeatherDetailAssembly.swift
//  WeatherApp
//
//  Created by Anatoly Kustov on 14.08.2021.
//

/// Базовая сборка флоу с детальной информацией
final class WeatherDetailAssembly {
	/// Создание модуля
	/// - Parameters:
	/// 	- coordinator координатор
	/// 	- weather погода
	/// - Returns: Флоу с детальной информацией
	func createModule(coordinator: WeatherDetailCoordinatorInput,
					  weather: WeatherScheme) -> (Presentable) {
		let viewController = WeatherDetailViewController()
		let interactor = WeatherDetailInteractor(cityWeather: weather)
		let presenter = WeatherDetailPresenter()

		viewController.output = coordinator
		viewController.interactor = interactor
		interactor.presenter = presenter
		presenter.viewController = viewController

		interactor.start()

		return viewController
	}
}
