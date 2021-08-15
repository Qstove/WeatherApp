//
//  CityCell.swift
//  WeatherApp
//
//  Created by Anatoly Kustov on 14.08.2021.
//

import UIKit
import SnapKit

final class CityCell: UITableViewCell {
	private var cityNameLabel = UILabel()
	private var temperatureLabel = UILabel()
	private var cityId: Int = 0

	private let cellOffset = 10

	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		setupViews()
		setupLayout()
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	/// Сконфигурировать ячейку
	/// - Parameters:
	///    - cityName: имя города
	///    - temperature: температура
	///    - cityId: id города
	func configureCell(with cityName: String,
					   temperature: String? = nil,
					   cityId: Int) {
		self.cityId = cityId
		cityNameLabel.text = cityName
		if let temperature = temperature {
			temperatureLabel.text = temperature + "°C"
		}
	}

	private func setupViews() {
		temperatureLabel.numberOfLines = 0
		temperatureLabel.textAlignment = .right
		contentView.addSubview(cityNameLabel)

		temperatureLabel.numberOfLines = 0
		contentView.addSubview(temperatureLabel)
	}

	private func setupLayout() {
		cityNameLabel.snp.makeConstraints {
			$0.leading.top.equalToSuperview().offset(cellOffset)
			$0.bottom.equalToSuperview().offset(-cellOffset)
			$0.trailing.equalTo(temperatureLabel.snp.leading)
		}
		temperatureLabel.snp.makeConstraints {
			$0.top.equalToSuperview().offset(cellOffset)
			$0.bottom.trailing.equalToSuperview().offset(-cellOffset)
			$0.leading.equalTo(cityNameLabel.snp.trailing)
		}
	}
}
