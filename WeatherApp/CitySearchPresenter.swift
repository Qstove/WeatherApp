//
//  CitySearchPresenter.swift
//  WeatherApp
//
//  Created by Anatoly Kustov on 14.08.2021.
//

final class CitySearchPresenter {
	weak var viewController: CitySearchViewInput?
}

extension CitySearchPresenter: CitySearchPresenterInput {
	func presentCityListWith(cityDictElements: [Dictionary<Int, String>.Element]) {
		viewController?.updateTableViewContent(with: cityDictElements)
	}
}
