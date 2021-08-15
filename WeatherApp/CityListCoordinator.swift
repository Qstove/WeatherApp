//
//  CityListCoordinator.swift
//  WeatherApp
//
//  Created by Anatoly Kustov on 14.08.2021.
//

import Foundation
import UIKit

/// Координатор флоу  списка сохраненных городов
final class CityListCoordinator: CoordinatorProtocol {
	private var cityListModule: CityListViewInput?
	private let router: Router

	/// Координатор флоу поиска города
	private var citySearchCoordinator: CitySearchCoordinatorInput?
	/// Координатор флоу детальной информации по погоде
	private var weatherDetailCoordinator: WeatherDetailCoordinatorInput?

	/// Инициализация координатора флоу  списка сохраненных городов
	/// - Parameters:
	///    - router: роутер
	init(router: Router) {
		self.router = router
	}

	/// Старт флоу
	func start() {
		showCityList()
	}

	private func showCityList() {
		let showCityListVC = CityListAssembly()
			.createModule(coordinator: self,
						  dataStore: UserDefaultsHelper(),
						  networkService: WeatherNetworkService())
		cityListModule = showCityListVC
		router.push(showCityListVC)
	}

	private func startCitySearchFlow() {
		let nc = UINavigationController()
		let citySearchRouter = Router(rootController: nc)
		let coordinator = CitySearchCoordinator(router: citySearchRouter)
		coordinator.output = self
		coordinator.start()
		citySearchCoordinator = coordinator
		router.present(nc, mode: .modalPageSheet(dismissible: true))
	}
	
	private func startWeatherDetailFlow(with weather: WeatherScheme) {
		let coordinator = WeatherDetailCoordinator(router: router)
		coordinator.output = self
		coordinator.startWith(weather: weather)
		weatherDetailCoordinator = coordinator
	}
}


extension CityListCoordinator: CityListCoordinatorInput {
	func didTappedCityCellWith(weather: WeatherScheme) {
		startWeatherDetailFlow(with: weather)
	}

	func didTappedAddCityButton() {
		startCitySearchFlow()
	}
}


extension CityListCoordinator: CitySearchCoordinatorOutput {
	func finishFlowWith(city name: String,
						id: Int) {
		citySearchCoordinator = nil
		cityListModule?.addCityWith(city: name,
									id: id)
	}

	func dismissFlow() {
		citySearchCoordinator = nil
	}
}


extension CityListCoordinator: WeatherDetailCoordinatorOutput {
	func weatherDetailFlowFinished() {
		weatherDetailCoordinator = nil
	}
}

