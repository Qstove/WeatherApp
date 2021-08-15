//
//  WeatherDetailViewController.swift
//  WeatherApp
//
//  Created by Anatoly Kustov on 14.08.2021.
//

import UIKit
import SnapKit

/// VC со списком добавленных городов
final class WeatherDetailViewController: UIViewController {
	var interactor: WeatherDetailInteractorInput?
	weak var output: WeatherDetailCoordinatorInput?

	private var temperatureLabel = UILabel()
	private var feelsLikeLabel = UILabel()
	private var tempMinLabel = UILabel()
	private var tempMaxLabel = UILabel()
	private var pressureLabel = UILabel()

	private let labelHeight = 50

	override public func viewDidLoad() {
		super.viewDidLoad()
		setupViews()
		setupLayout()
	}

	override func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(animated)
		if self.isMovingFromParent {
			output?.finishWeatherDetailFlow()
		}
	}

	private func setupViews() {
		view.backgroundColor = .white
		view.addSubview(temperatureLabel)
		view.addSubview(feelsLikeLabel)
		view.addSubview(tempMinLabel)
		view.addSubview(tempMaxLabel)
		view.addSubview(pressureLabel)
	}

	private func setupLayout() {
		temperatureLabel.snp.makeConstraints {
			$0.top.equalToSuperview().offset(50)
			$0.leading.equalToSuperview().offset(15)
			$0.trailing.equalToSuperview().offset(-15)
			$0.height.equalTo(labelHeight)
		}
		feelsLikeLabel.snp.makeConstraints {
			$0.leading.equalToSuperview().offset(15)
			$0.trailing.equalToSuperview().offset(-15)
			$0.height.equalTo(labelHeight)
			$0.top.equalTo(temperatureLabel.snp.bottom).offset(5)
		}
		tempMinLabel.snp.makeConstraints {
			$0.leading.equalToSuperview().offset(15)
			$0.trailing.equalToSuperview().offset(-15)
			$0.height.equalTo(labelHeight)
			$0.top.equalTo(feelsLikeLabel.snp.bottom).offset(5)
		}
		tempMaxLabel.snp.makeConstraints {
			$0.leading.equalToSuperview().offset(15)
			$0.trailing.equalToSuperview().offset(-15)
			$0.height.equalTo(labelHeight)
			$0.top.equalTo(tempMinLabel.snp.bottom).offset(5)
		}
		pressureLabel.snp.makeConstraints {
			$0.leading.equalToSuperview().offset(15)
			$0.trailing.equalToSuperview().offset(-15)
			$0.height.equalTo(labelHeight)
			$0.top.equalTo(tempMaxLabel.snp.bottom).offset(5)
		}
	}
}

extension WeatherDetailViewController: WeatherDetailViewInput {
	func displayDetailInfo(viewModel: DetailWeatherViewModel) {
		title = viewModel.cityName
		temperatureLabel.text = "Temperature: " + viewModel.temperature + "°C"
		feelsLikeLabel.text = "Feels like: " + viewModel.feelsLike + "°C"
		tempMinLabel.text = "Min. temp. : " + viewModel.tempMin + "°C"
		tempMaxLabel.text = "Max. temp. : " + viewModel.tempMax + "°C"
		pressureLabel.text = "Pressure : " + viewModel.pressure
	}
}
