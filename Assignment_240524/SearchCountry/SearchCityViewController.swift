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
    
    var citys = CityInfo().city
    var filteredCitys = CityInfo().city
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "여행 도시 탐색"
        tableViewUI()
        segmentUI()
        segmentTapped(segment: segment)
    }

    func tableViewUI() {
        cityTableView.delegate = self
        cityTableView.dataSource = self
        
        cityTableView.rowHeight = 180
        cityTableView.layer.cornerRadius = 12
        
        let xib = UINib(nibName: SearchCityTableViewCell.identifier, bundle: nil)
        cityTableView.register(xib, forCellReuseIdentifier: SearchCityTableViewCell.identifier)
    }
    
    func segmentUI() {
        segment.setTitle("모두", forSegmentAt: 0)
        segment.setTitle("국내", forSegmentAt: 1)
        segment.setTitle("해외", forSegmentAt: 2)
    }
    
    func segmentTapped(segment: UISegmentedControl) {
        segment.addTarget(self, action: #selector(filterList), for: .valueChanged)
    }
    
    @objc func filterList() {
        switch segment.selectedSegmentIndex {
        case 1:
            filteredCitys = citys.filter { $0.domestic_travel }
            cityTableView.reloadData()
            return
        case 2:
            filteredCitys = citys.filter { !$0.domestic_travel }
            cityTableView.reloadData()
            return
        default:
            filteredCitys = citys
            cityTableView.reloadData()
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
        switch segment.selectedSegmentIndex {
        case 1:
            filteredCitys = citys.filter { $0.domestic_travel }
            return filteredCitys.count
        case 2:
            return filteredCitys.count
        default:
            return citys.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = filteredCitys[indexPath.row]
        
        let cell = cityTableView.dequeueReusableCell(withIdentifier: SearchCityTableViewCell.identifier, for: indexPath) as! SearchCityTableViewCell
        
        cell.searchCityTableViewCell(city: data)
        
        return cell
    }
    
}
