//
//  UserDefaultsHelperInput.swift
//  WeatherApp
//
//  Created by Anatoly Kustov on 14.08.2021.
//

import Foundation

protocol UserDefaultsHelperInput {
	/// Сохранить добавленные города
	/// - Parameter citiesDict - словарь с городами
	func saveCitiesWith(citiesDict: Dictionary<Int, String>)
	
	/// Возвращает сохраненные ранее города
	/// - Returns словарь с городами
	func getCitiesDict() -> Dictionary<Int, String> 
}
