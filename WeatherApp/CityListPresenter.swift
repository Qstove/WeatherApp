//
//  CityListPresenter.swift
//  WeatherApp
//
//  Created by Anatoly Kustov on 14.08.2021.
//

import Foundation

final class CityListPresenter {
	weak var viewController: CityListViewInput?
}

extension CityListPresenter: CityListPresenterInput {
	func presentSavedCities(with data: [WeatherScheme]) {
		let cityViewModels: [CityViewModel] = data
			.map {
				let cityViewModel = CityViewModel(id: $0.id ?? 0,
												  name: $0.name ?? "-",
												  temperature: $0.main?.temp ?? 0.0)
				return cityViewModel
			}
			.sorted { $0.name < $1.name}
		viewController?.updateTableViewContent(with: cityViewModels)
	}

	func presentEmptySavedCityList() {
		viewController?.displayNoCitiesError()
	}

	func presentLoading() {
		viewController?.displayLoading()
	}
}
