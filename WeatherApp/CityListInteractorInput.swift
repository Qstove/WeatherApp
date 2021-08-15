//
//  CityListInteractorInput.swift
//  WeatherApp
//
//  Created by Anatoly Kustov on 14.08.2021.
//

protocol CityListInteractorInput: AnyObject {
	/// Стартовать сервисы
	func start()
	/// Сохранить город
	/// - Parameters:
	///    - name: название города
	///    - id: id
	func saveCity(name: String,
				  id: Int)
	/// Получить загруженные данные по городу
	/// - Parameters:
	///    - id: id
	func getWeatherForCityWith(id: Int) -> WeatherScheme?
}
