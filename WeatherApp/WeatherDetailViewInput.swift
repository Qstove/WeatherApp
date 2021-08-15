//
//  WeatherDetailViewInput.swift
//  WeatherApp
//
//  Created by Anatoly Kustov on 14.08.2021.
//

protocol WeatherDetailViewInput: AnyObject {
	/// Отобразить детальную информацию по погоде
	/// 	- Parameter viewModel - вью модель
	func displayDetailInfo(viewModel: DetailWeatherViewModel)
}
