//
//  BaseCoordinator.swift
//  WeatherApp
//
//  Created by Anatoly Kustov on 14.08.2021.
//

import Foundation

/// Протокол описывает координатор
protocol CoordinatorProtocol: AnyObject {
		/// Запускает координатор
		func start()
}
