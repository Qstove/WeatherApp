//
//  CitySearchCoordinator.swift
//  WeatherApp
//
//  Created by Anatoly Kustov on 14.08.2021.
//

final class CitySearchCoordinator: CoordinatorProtocol {
	/// Оутпут координатора флоу поиска города
	var output: CitySearchCoordinatorOutput?
	private let router: Router

	/// Инициализация координатора флоу поиска города
	/// - Parameters:
	///    - router: роутер
	init(router: Router) {
		self.router = router
	}

	func start() {
		showCitySearchFlow()
	}

	private func showCitySearchFlow() {
		let citySearchVC = CitySearchAssembly()
			.createModule(coordinator: self,
						  dataStore: CityProvider.shared)
		router.push(citySearchVC)
	}
}


extension CitySearchCoordinator: CitySearchCoordinatorInput {
	func didTappedCityCellWith(city name: String, id: Int) {
		output?.finishFlowWith(city: name, id: id)
		router.dismissModule()
	}

	func didTappedCloseCityButton() {
		output?.dismissFlow()
		router.dismissModule()
	}
}
