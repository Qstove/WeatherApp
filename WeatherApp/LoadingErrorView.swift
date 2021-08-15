//
//  LoadingErrorView.swift
//  WeatherApp
//
//  Created by Anatoly Kustov on 14.08.2021.
//

import UIKit
import SnapKit

final class LoadingErrorView: UIView {
	var loadingView = UIActivityIndicatorView()
	var titleLabel = UILabel()

	override func didMoveToSuperview() {
		setupViews()
		setupLayout()
	}

	func setState(to state: LoadingErrorViewState,
				  title: String? = nil) {
		switch state {
		case .loading:
			self.isHidden = false
			loadingView.startAnimating()
			titleLabel.text = title
		case .done:
			self.isHidden = true
			loadingView.stopAnimating()
		case .error:
			self.isHidden = false
			loadingView.stopAnimating()
			titleLabel.text = title
		}
	}

	private func setupViews() {
		backgroundColor = .white
		addSubview(loadingView)
		addSubview(titleLabel)
	}

	private func setupLayout() {
		loadingView.snp.makeConstraints {
			$0.center.equalToSuperview()
		}
		titleLabel.snp.makeConstraints {
			$0.centerX.equalToSuperview()
			$0.top.equalTo(loadingView.snp.bottom).offset(20)
		}
	}
}

enum LoadingErrorViewState {
	case loading
	case error
	case done
}
