//
//  RouterProtocol.swift
//  WeatherApp
//
//  Created by Anatoly Kustov on 14.08.2021.
//

import UIKit

public enum RouterModulePresentMode {
	/// На весь экран
	case fullScreen
	/// modal
	case modalPageSheet(dismissible: Bool)
}

public protocol RouterProtocol: Presentable {
	var state: [Presentable] { get }

	func present(_ module: Presentable?)
	func present(_ module: Presentable?,
				 mode: RouterModulePresentMode)
	func present(_ module: Presentable?,
				 mode: RouterModulePresentMode,
				 animated: Bool)
	func present(_ module: Presentable?,
				 mode: RouterModulePresentMode,
				 animated: Bool,
				 onDismiss: @escaping () -> Void)

	func push(_ module: Presentable?)
	func push(_ module: Presentable?, animated: Bool)
	func push(_ module: Presentable?, animated: Bool, completion: (() -> Void)?)

	func popModule()
	func popModule(animated: Bool)

	func dismissModule()
	func dismissModule(animated: Bool,
					   completion: (() -> Void)?)

	func setRootModule(_ module: Presentable?)

	func popToRootModule(animated: Bool)

	func pop(to module: Presentable?, animated: Bool)
}
