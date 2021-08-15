//
//  CitySearchCoordinatorOutput.swift
//  WeatherApp
//
//  Created by Anatoly Kustov on 14.08.2021.
//

protocol CitySearchCoordinatorOutput {
	/// Завершить флоу
	/// - Parameters:
	/// 	- name название города
	/// 	- id города
	func finishFlowWith(city name: String,
						id: Int)

	/// Закрыть флоу
	func dismissFlow()
}
