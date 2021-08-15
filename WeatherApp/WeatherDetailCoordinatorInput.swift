//
//  WeatherDetailCoordinatorInput.swift
//  WeatherApp
//
//  Created by Anatoly Kustov on 14.08.2021.
//

protocol WeatherDetailCoordinatorInput: AnyObject {
	///Завершить флоу с детальной информацией о погоде
	func finishWeatherDetailFlow()
}
