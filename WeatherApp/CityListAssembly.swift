//
//  CityListAssembly.swift
//  WeatherApp
//
//  Created by Anatoly Kustov on 14.08.2021.
//

import Foundation

/// Базовая сборка флоу со списком городов
final class CityListAssembly {
	/// Создание модуля
	/// - Parameters:
	/// 	- coordinator координатор
	/// 	- datastore хранилище сохраненных городов
	/// 	- networkService нетворк сервис для получения данных из сети
	/// - Returns: флоу со списком городов
	func createModule(coordinator: CityListCoordinatorInput,
					  dataStore: UserDefaultsHelperInput,
					  networkService: WeatherNetworkServiceInput) -> (CityListViewInput) {
		let viewController = CityListViewController()
		let interactor = CityListInteractor(dataStore: dataStore,
											networkService: networkService)
		let presenter = CityListPresenter()
		viewController.output = coordinator
		viewController.interactor = interactor
		interactor.presenter = presenter
		presenter.viewController = viewController

		interactor.start()

		return viewController
	}
}
