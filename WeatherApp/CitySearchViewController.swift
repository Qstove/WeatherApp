//
//  CitySearchViewController.swift
//  WeatherApp
//
//  Created by Anatoly Kustov on 14.08.2021.
//

import UIKit

final class CitySearchViewController: UIViewController {
	weak var output: CitySearchCoordinatorInput?
	var interactor: CitySearchInteractorInput?

	private let searchController = UISearchController(searchResultsController: nil)
	private var cityListTableView = UITableView()
	private var cityDict = [Dictionary<Int, String>.Element]()
	private var filteredCityDict = [Dictionary<Int, String>.Element]()

	var isSearchBarEmpty: Bool {
		return searchController.searchBar.text?.isEmpty ?? true
	}
	var isFiltering: Bool {
		return searchController.isActive && !isSearchBarEmpty
	}

	override public func viewDidLoad() {
		super.viewDidLoad()
		setupViews()
		setupLayout()
	}

	override public func viewWillAppear(_ animated: Bool) {

	}

	private func setupViews() {
		configureNavBar()
		view.backgroundColor = .white
		searchController.searchResultsUpdater = self
		searchController.obscuresBackgroundDuringPresentation = false
		definesPresentationContext = true

		cityListTableView.dataSource = self
		cityListTableView.delegate = self
		cityListTableView.register(CityCell.self, forCellReuseIdentifier: "CitySearchCell")
		view.addSubview(cityListTableView)
	}

	private func setupLayout() {
		cityListTableView.snp.makeConstraints {
			$0.edges.equalToSuperview()
		}
	}

	private func configureNavBar() {
		title = "Add city"
		let closeButton = UIBarButtonItem(title: "Close", style: .plain, target: self, action: #selector(closeButtonTapped))
		navigationItem.leftBarButtonItems = [closeButton]
		navigationItem.searchController = searchController
		navigationItem.hidesSearchBarWhenScrolling = false
	}

	private func filterContentForSearchText(searchText: String) {
		filteredCityDict = cityDict.filter { (key: Int, value: String) -> Bool in
			return value.lowercased().contains(searchText.lowercased())
		}
		cityListTableView.reloadData()
	}

	@objc private func closeButtonTapped() {
		output?.didTappedCloseCityButton()
	}
}

// MARK: CitySearchViewInput protocol conformance
extension CitySearchViewController: CitySearchViewInput {
	func updateTableViewContent(with cityDict:[Dictionary<Int, String>.Element]) {
		self.cityDict = cityDict
		cityListTableView.reloadData()
	}
}


// MARK: UITableViewDelegate protocol conformance
extension CitySearchViewController: UITableViewDelegate {
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let selectedCityElement = isFiltering ? filteredCityDict[indexPath.row] : cityDict[indexPath.row]
		output?.didTappedCityCellWith(city: selectedCityElement.value,
									  id: selectedCityElement.key)
	}

	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 50
	}
}


// MARK: UITableViewDataSource protocol conformance
extension CitySearchViewController: UITableViewDataSource {
	func tableView(_ tableView: UITableView,
				   numberOfRowsInSection section: Int) -> Int {
		return isFiltering ? filteredCityDict.count : cityDict.count
	}

	func tableView(_ tableView: UITableView,
				   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = CityCell()
		let cityElement = isFiltering ? filteredCityDict[indexPath.row] : cityDict[indexPath.row]
		cell.configureCell(with: cityElement.value,
						   cityId: cityElement.key)
		return cell
	}
}


// MARK: UISearchResultsUpdating protocol conformance
extension CitySearchViewController: UISearchResultsUpdating {
	func updateSearchResults(for searchController: UISearchController) {
		let searchBar = searchController.searchBar
		filterContentForSearchText(searchText: searchBar.text!)
	}
}
