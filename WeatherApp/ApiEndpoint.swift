//
//  ApiEndpoint.swift
//  WeatherApp
//
//  Created by Anatoly Kustov on 14.08.2021.
//

enum ApiEndpoint {
	static func getAPIWeatherPathForCity(id: String) -> String {
		return ApiConst.baseURL + "data/2.5/weather?id=\(id)&appid=\(ApiConst.appId)&units=\(ApiConst.unit)"
	}

	static func getAPIWeatherPathForCities(ids: String) -> String {
		return ApiConst.baseURL + "data/2.5/group?id=\(ids)&appid=\(ApiConst.appId)&units=\(ApiConst.unit)"
	}
}

fileprivate enum ApiConst {
	static let baseURL = "https://api.openweathermap.org/"
	static let iconBaseURL = "http://openweathermap.org/"
	static let unit = "metric"
	static let appId = "6a11ef595303eaf5265fdc2a7a480946"
	static let validStatusCodeRange = 200..<300
}
