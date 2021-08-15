//
//  CitySearchInteractor.swift
//  WeatherApp
//
//  Created by Anatoly Kustov on 14.08.2021.
//

import Foundation

final class CitySearchInteractor {
	/// Презентер
	var presenter: CitySearchPresenterInput?
	private let dataStore: CityProviderInput

	/// Инициализация интерактора флоу  добавлениягородов
	/// - Parameters:
	///    - dataStore: хранилище
	init(dataStore: CityProviderInput) {
		self.dataStore = dataStore
	}
}

extension CitySearchInteractor: CitySearchInteractorInput {
	func start() {
		presenter?.presentCityListWith(cityDictElements: dataStore.getAllCities())
	}
}
