//
//  CityListViewController.swift
//  WeatherApp
//
//  Created by Anatoly Kustov on 14.08.2021.
//

import UIKit
import SnapKit

/// VC со списком добавленных городов
final class CityListViewController: UIViewController {
	var interactor: CityListInteractorInput?
	weak var output: CityListCoordinatorInput?

	private var cityListTableView = UITableView()
	private var loadingErrorView = LoadingErrorView()
	private var cityViewModels = [CityViewModel]()

	override public func viewDidLoad() {
		super.viewDidLoad()
		setupViews()
		setupLayout()
	}

	private func setupViews() {
		configureNavBar()
		view.addSubview(cityListTableView)
		view.addSubview(loadingErrorView)
		cityListTableView.delegate = self
		cityListTableView.dataSource = self
		cityListTableView.register(CityCell.self, forCellReuseIdentifier: "CityListCell")
	}

	private func configureNavBar() {
		title = "Saved cities"
		let addCity = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addCityButtonTapped))

		navigationItem.rightBarButtonItems = [addCity]
	}

	private func setupLayout() {
		loadingErrorView.snp.makeConstraints {
			$0.edges.equalToSuperview()
		}
		cityListTableView.snp.makeConstraints {
			$0.edges.equalToSuperview()
		}
	}

	@objc private func addCityButtonTapped() {
		output?.didTappedAddCityButton()
	}
}


// MARK: CityListViewInput protocol conformance
extension CityListViewController: CityListViewInput {
	func updateTableViewContent(with cityViewModels: [CityViewModel]) {
		loadingErrorView.setState(to: .done)
		self.cityViewModels = cityViewModels
		cityListTableView.reloadData()
	}

	func displayNoCitiesError() {
		loadingErrorView.setState(to: .error, title: "No saved cities")
	}

	func addCityWith(city name: String,
					 id: Int) {
		interactor?.saveCity(name: name,
							 id: id)
	}

	func displayLoading() {
		loadingErrorView.setState(to: .loading, title: "Loading")
	}
}


// MARK: UITableViewDelegate protocol conformance
extension CityListViewController: UITableViewDelegate {
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		guard let weather = interactor?.getWeatherForCityWith(id: cityViewModels[indexPath.row].id) else { return }
		output?.didTappedCityCellWith(weather: weather)
		tableView.deselectRow(at: indexPath, animated: true)
	}

	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 50
	}
}


// MARK: UITableViewDataSource protocol conformance
extension CityListViewController: UITableViewDataSource {
	func tableView(_ tableView: UITableView,
				   numberOfRowsInSection section: Int) -> Int {
		return cityViewModels.count
	}

	func tableView(_ tableView: UITableView,
				   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = CityCell()
		cell.configureCell(with: cityViewModels[indexPath.row].name,
						   temperature: String(cityViewModels[indexPath.row].temperature),
						   cityId: cityViewModels[indexPath.row].id)
		return cell
	}
}
