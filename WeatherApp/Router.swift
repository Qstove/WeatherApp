//
//  Router.swift
//  WeatherApp
//
//  Created by Anatoly Kustov on 14.08.2021.
//

import UIKit

open class Router: NSObject, RouterProtocol {
	private weak var rootController: UINavigationController?

	private var completions: [UIViewController: () -> Void]
	private var animationCompletion: (() -> Void)?

	public init(rootController: UINavigationController) {
		self.rootController = rootController
		completions = [:]

		super.init()
		self.rootController?.delegate = self
	}

	public var state: [Presentable] {
		return rootController?.viewControllers ?? []
	}

	public func toPresent() -> UIViewController? {
		return rootController
	}

	public func present(_ module: Presentable?) {
		present(module, mode: .fullScreen)
	}

	public func present(_ module: Presentable?, mode: RouterModulePresentMode) {
		present(module, mode: mode, animated: true)
	}

	public func present(_ module: Presentable?, mode: RouterModulePresentMode, animated: Bool) {
		switch mode {
		case .fullScreen:
			guard let controller = module?.toPresent() else { return }
			controller.modalPresentationStyle = .fullScreen
			rootController?.present(controller, animated: animated)
		case .modalPageSheet(let dismissible):
			guard let controller = module?.toPresent() else { return }

			controller.modalPresentationStyle = .pageSheet
			controller.preferredContentSize = CGSize(width: 768, height: 646)
			controller.isModalInPresentation = !dismissible

			rootController?.present(controller, animated: animated)
		}
	}

	public func present(_ module: Presentable?,
						mode: RouterModulePresentMode,
						animated: Bool,
						onDismiss: @escaping () -> Void) {
		guard let presented = module?.toPresent() else { return }

		presented.presentationController?.delegate = self
		completions[presented] = onDismiss
		present(module, mode: mode, animated: animated)
	}

	public func dismissModule() {
		dismissModule(animated: true,
					  completion: nil)
	}

	public func dismissModule(animated: Bool,
							  completion: (() -> Void)?) {
		rootController?.dismiss(animated: animated,
								completion: completion)
	}

	public func push(_ module: Presentable?) {
		push(module,
			 animated: true)
	}

	public func push(_ module: Presentable?,
					 animated: Bool) {
		push(module,
			 animated: animated,
			 completion: nil)
	}

	public func push(_ module: Presentable?,
					 animated: Bool,
					 completion: (() -> Void)?) {
		guard
			let controller = module?.toPresent(),
			!(controller is UINavigationController)
		else {
			assertionFailure("Deprecated push UINavigationController.")
			return
		}

		completions[controller] = completion

		rootController?.pushViewController(controller,
										   animated: animated)
	}

	public func popModule() {
		popModule(animated: true)
	}

	public func popModule(animated: Bool) {
		if let controllers = rootController?.viewControllers.dropLast() {
			setCompletions(Array(controllers))
		}
		rootController?.popViewController(animated: animated)
	}

	public func setRootModule(_ module: Presentable?) {
		guard let controller = module?.toPresent() else { return }

		setCompletions([controller])

		rootController?.setViewControllers([controller], animated: false)
	}

	public func popToRootModule(animated: Bool) {
		if let topController = rootController?.topViewController {
			setCompletions([topController])
		}
		rootController?.popToRootViewController(animated: animated)
	}

	public func pop(to module: Presentable?,
					animated: Bool) {
		guard
			let controller = module?.toPresent(),
			let rootController = rootController
		else {
			return
		}

		var controllers = rootController.viewControllers

		if let index = controllers.firstIndex(where: { $0 === controller }) {
			controllers = Array(controllers[...index])
		}
		setCompletions(controllers)
		rootController.popToViewController(controller,
										   animated: animated)
	}

	// MARK: - Private Methods

	private func runCompletion(for controller: UIViewController) {
		guard let completion = completions[controller] else { return }

		completion()
		completions.removeValue(forKey: controller)
	}

	private func setCompletions(_ viewControllers: [UIViewController]) {
		for key in completions.keys where !viewControllers.contains(key) {
			completions.removeValue(forKey: key)
		}
	}

	private func runAnimationCompletion() {
		animationCompletion?()
		animationCompletion = nil
	}
}

extension Router: UINavigationControllerDelegate {
	public func navigationController(_ navigationController: UINavigationController,
									 didShow viewController: UIViewController,
									 animated: Bool) {
		runAnimationCompletion()
		
		guard
			let poppedViewController = navigationController.transitionCoordinator?.viewController(forKey: .from),
			!navigationController.viewControllers.contains(poppedViewController)
		else {
			return
		}
		
		runCompletion(for: poppedViewController)
	}
}

extension Router: UIAdaptivePresentationControllerDelegate {
	public func presentationControllerDidDismiss(_ presentationController: UIPresentationController) {
		runCompletion(for: presentationController.presentedViewController)
	}
}
