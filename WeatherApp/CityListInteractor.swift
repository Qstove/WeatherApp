//
//  CityListInteractor.swift
//  WeatherApp
//
//  Created by Anatoly Kustov on 14.08.2021.
//

final class CityListInteractor {
	/// Презентер
	var presenter: CityListPresenterInput?

	private let dataStore: UserDefaultsHelperInput
	private let networkService: WeatherNetworkServiceInput
	private var downloadedWeather = [WeatherScheme] ()

	/// Инициализация интерактора флоу  списка сохраненных городов
	/// - Parameters:
	///    - dataStore: хранилище
	///    - networkService: сервис для работы с сетью
	init(dataStore: UserDefaultsHelperInput,
		 networkService: WeatherNetworkServiceInput) {
		self.dataStore = dataStore
		self.networkService = networkService
	}

	private func getWeatherForSavedCities() {
		presenter?.presentLoading()
		let citiesDict = dataStore.getCitiesDict()
		if !citiesDict.isEmpty {
			networkService.getWeatherForCitiesWith(ids: [Int](citiesDict.keys)) { [weak self] weather in
				if let weather = weather {
					self?.downloadedWeather = weather
					self?.presenter?.presentSavedCities(with: weather)
				}
			}
		} else {
			presenter?.presentEmptySavedCityList()
		}
	}
}

extension CityListInteractor: CityListInteractorInput {
	func start() {
		getWeatherForSavedCities()
	}

	func saveCity(name: String,
				  id: Int) {
		var citiesDict = dataStore.getCitiesDict()
		citiesDict[id] = name
		dataStore.saveCitiesWith(citiesDict: citiesDict)
		getWeatherForSavedCities()
	}

	func getWeatherForCityWith(id: Int) -> WeatherScheme? {
		return downloadedWeather.first { weather in
			id == (weather.id ?? 0)
		}
	}
}
