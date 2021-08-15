//
//  UserDefaultsHelper.swift
//  WeatherApp
//
//  Created by Anatoly Kustov on 14.08.2021.
//

import Foundation

/// Класс, описывающий хелпер для взаимодействия с UserDefaults
final class UserDefaultsHelper: UserDefaultsHelperInput {
	private let userDefaults = UserDefaults.standard
	private let cityKeyDict = "cityDict"

	func saveCitiesWith(citiesDict: Dictionary<Int, String>) {
		let encodedData = try! NSKeyedArchiver.archivedData(withRootObject: citiesDict, requiringSecureCoding: false)
		userDefaults.set(encodedData, forKey: cityKeyDict)
	}

	func getCitiesDict() -> Dictionary<Int, String> {
		if let object = userDefaults.object(forKey: cityKeyDict) {
			let decoded = object as! Data
			let decodedDict = try! NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(decoded) as! Dictionary<Int, String>
			return decodedDict
		} else {
			let emptyDict = Dictionary<Int, String>()
			return emptyDict
		}
	}
}
