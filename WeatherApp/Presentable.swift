//
//  Presentable.swift
//  WeatherApp
//
//  Created by Anatoly Kustov on 14.08.2021.
//

import UIKit

/// Протокол описывает объект, который будет отображаться с помощью Router'a
public protocol Presentable {
	/// Возвращает ViewController, который предназначен для отображения контента
	/// - Returns: ViewController для отображения контента
	func toPresent() -> UIViewController?
}

extension UIViewController: Presentable {
	public func toPresent() -> UIViewController? {
		self
	}
}
