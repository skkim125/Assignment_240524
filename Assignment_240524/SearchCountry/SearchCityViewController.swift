//
//  SearchCountryViewController.swift
//  Assignment_240524
//
//  Created by 김상규 on 5/29/24.
//

import UIKit

class SearchCityViewController: UIViewController {
    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var segment: UISegmentedControl!
    @IBOutlet var cityTableView: UITableView!
    
    var cities = CityInfo().city
    var filteredCities = CityInfo().city
    var domestics = CityInfo().city.filter { $0.domestic_travel }
    var notDomestics = CityInfo().city.filter { !$0.domestic_travel }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        
        navigationItem.title = "여행 도시 탐색"
        tableViewUI()
        segmentUI()
        segmentTapped(segment: segment)
    }

    // cityTableView UI
    func tableViewUI() {
        cityTableView.delegate = self
        cityTableView.dataSource = self
        
        cityTableView.rowHeight = 180
        cityTableView.layer.cornerRadius = 12
        
        let xib = UINib(nibName: SearchCityTableViewCell.identifier, bundle: nil)
        cityTableView.register(xib, forCellReuseIdentifier: SearchCityTableViewCell.identifier)
    }
    
    // segment UI
    func segmentUI() {
        segment.setTitle("모두", forSegmentAt: 0)
        segment.setTitle("국내", forSegmentAt: 1)
        segment.setTitle("해외", forSegmentAt: 2)
    }
    
    // segment 탭 메서드
    func segmentTapped(segment: UISegmentedControl) {
        segment.addTarget(self, action: #selector(filterList), for: .valueChanged)
    }
    
    // segment 탭에 따른 필터 로직 메서드
    @objc func filterList() {
        switch segment.selectedSegmentIndex {
        case 0:
            filteredCities = cities
            cityTableView.reloadData()
        case 1:
            filteredCities = domestics
            cityTableView.reloadData()
            return
        case 2:
            filteredCities = notDomestics
            cityTableView.reloadData()
            return
        default:
            return
        }
    }
    
//    @IBAction func segmentTapped(_ sender: UISegmentedControl) {
//        switch sender.selectedSegmentIndex {
//        case 1:
//            filteredCitys = citys.filter { $0.domestic_travel }
//            cityTableView.reloadData()
//            return
//        case 2:
//            filteredCitys = citys.filter { !$0.domestic_travel }
//            cityTableView.reloadData()
//            return
//        default:
//            filteredCitys = citys
//            cityTableView.reloadData()
//            return
//        }
//        
//    }
}

extension SearchCityViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(#function, filteredCities)
        if !filteredCities.isEmpty {
            switch segment.selectedSegmentIndex {
            case 0:
                return filteredCities.count
            case 1:
                return filteredCities.count
            case 2:
                return filteredCities.count
            default:
                return 0
            }
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(#function, filteredCities[indexPath.row].city_name)
        print(indexPath)
        
        if !filteredCities.isEmpty {
            let data = filteredCities[indexPath.row]
            let cell = cityTableView.dequeueReusableCell(withIdentifier: SearchCityTableViewCell.identifier, for: indexPath) as! SearchCityTableViewCell
            
            cell.searchCityTableViewCell(city: data)
            
            return cell
        } else {
            // filteredCities = cities
            let data = filteredCities[indexPath.row]
            let cell = cityTableView.dequeueReusableCell(withIdentifier: SearchCityTableViewCell.identifier, for: indexPath) as! SearchCityTableViewCell
            cell.searchCityTableViewCell(city: data)
            
            return cell
        }
    }
}

extension SearchCityViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("\(searchText)")
        searchCities(searchText)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchCities(searchBar.text)
        view.endEditing(true)
    }
    
    func searchCities(_ searchText: String?) {
        
        guard let text = searchText else { return }
        
        guard !text.trimmingCharacters(in: .whitespaces).isEmpty else {
            searchBar.text = ""
            searchBar.placeholder = "한 글자 이상 입력해주세요"
            filteredCities = cities
            cityTableView.reloadData()
            return
        }
        
        switch segment.selectedSegmentIndex {
        case 0:
            filteredCities = cities.filter { city in
                city.city_english_name.contains(text) || city.city_name.contains(text) || city.city_explain.contains(text)
            }
        case 1:
            filteredCities = domestics.filter { city in
                city.city_english_name.contains(text) || city.city_name.contains(text) || city.city_explain.contains(text)
            }
        case 2:
            filteredCities = notDomestics.filter { city in
                city.city_english_name.contains(text) || city.city_name.contains(text) || city.city_explain.contains(text)
            }
        default:
            filteredCities = []
        }

        cityTableView.reloadData()
        
        
        guard !filteredCities.isEmpty else{
            cityTableView.reloadData()
            return
        }
    }
}
