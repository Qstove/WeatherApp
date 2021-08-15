//
//  WeatherNetworkService.swift
//  WeatherApp
//
//  Created by Anatoly Kustov on 14.08.2021.
//

import Alamofire
import Foundation

final class WeatherNetworkService: WeatherNetworkServiceInput {
	func getWeatherForCityWith(id: Int,
							   completion: @escaping (WeatherScheme?) -> Void) {
		AF.request(ApiEndpoint.getAPIWeatherPathForCity(id: String(id)),
				   method: .get,
				   encoding: JSONEncoding.default)
			.responseJSON { response in
				guard let data = response.data else { return }
				do {
					let weather = try JSONDecoder().decode(WeatherScheme.self, from: data)
					completion(weather)
				} catch {
					completion(nil)
				}
			}
	}

	func getWeatherForCitiesWith(ids: [Int],
								 completion: @escaping ([WeatherScheme]?) -> Void) {
		let idsForRequest = (ids.map{String($0)}).joined(separator: ",")
		AF.request(ApiEndpoint.getAPIWeatherPathForCities(ids: idsForRequest),
				   method: .get,
				   encoding: JSONEncoding.default)
			.responseJSON { response in
				guard let data = response.data else { return }
				do {
					let weather = try JSONDecoder().decode(WeatherSchemeMultiple.self, from: data)
					completion(weather.list)
				} catch {
					completion(nil)
				}
			}
	}
}
