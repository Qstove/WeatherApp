//
//  CitySearchAssembly.swift
//  WeatherApp
//
//  Created by Anatoly Kustov on 14.08.2021.
//

import Foundation

/// Базовая сборка флоу поиска города
final class CitySearchAssembly {
	/// Создание модуля
	/// - Parameters:
	/// 	- output аутпут
	/// 	- datastore хранилище сохраненных городов
	/// 	- networkService нетворк сервис для получения данных из сети
	/// - Returns: флоу поиска города
	func createModule(coordinator: CitySearchCoordinatorInput,
					  dataStore: CityProviderInput) -> (Presentable) {
		let viewController = CitySearchViewController()
		let interactor = CitySearchInteractor(dataStore: dataStore)
		let presenter = CitySearchPresenter()
		viewController.output = coordinator
		viewController.interactor = interactor
		interactor.presenter = presenter
		presenter.viewController = viewController

		interactor.start()

		return viewController
	}
}
