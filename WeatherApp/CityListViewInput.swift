//
//  CityListViewInput.swift
//  WeatherApp
//
//  Created by Anatoly Kustov on 14.08.2021.
//

protocol CityListViewInput: AnyObject, Presentable {
	/// Обновить контент tableview
	/// - Parameter cityViewModel - модели городов
	func updateTableViewContent(with cityViewModels: [CityViewModel])
	/// Отобразить информацию, что добавленных городов нет.
	func displayNoCitiesError()
	/// Добавить город в список сохраненных
	func addCityWith(city name: String,
					 id: Int)
	/// Отобразить, что идет загрузка
	func displayLoading()
}
