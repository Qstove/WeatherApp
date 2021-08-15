//
//  CitySearchViewInput.swift
//  WeatherApp
//
//  Created by Anatoly Kustov on 14.08.2021.
//

protocol CitySearchViewInput: AnyObject {
	/// Обновить контент tableview
	/// - Parameter cityDict  отсортированные элементы словаря с городами
	func updateTableViewContent(with cityDict: [Dictionary<Int, String>.Element])

}
