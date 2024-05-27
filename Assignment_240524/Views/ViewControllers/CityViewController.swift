//
//  CityViewController.swift
//  Assignment_240524
//
//  Created by 김상규 on 5/27/24.
//

import UIKit

class CityViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var cityTableView: UITableView!
    var list = TravelInfo().travel // travel 배열
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "도시 상세 정보"
        
        // delegate & dataSource 연결
        cityTableView.delegate = self
        cityTableView.dataSource = self
        
        // CityTableViewCell UINib 코드
        let cityNib = UINib(nibName: "CityTableViewCell", bundle: nil)
        cityTableView.register(cityNib, forCellReuseIdentifier: "CityTableViewCell")
        
        // AdTableViewCell UINib 코드
        let adNib = UINib(nibName: "AdTableViewCell", bundle: nil)
        cityTableView.register(adNib, forCellReuseIdentifier: "AdTableViewCell")
        
    }
    
    // 테이블뷰 셀 개수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return list.count
    }
    
    // 테이블뷰 셀의 높이: ad에 따라 다르게 설정
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if list[indexPath.row].ad {
            return 100
        } else {
            return 120
        }
    }
    
    // ad에 따라 표시할 테이블뷰 셀 설정
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = list[indexPath.row]
        
        if !data.ad {
            let cityCell = tableView.dequeueReusableCell(withIdentifier: "CityTableViewCell", for: indexPath) as! CityTableViewCell
            cityCell.configureCityCell(data: data)
            
            return cityCell
            
        } else {
            let adCell = tableView.dequeueReusableCell(withIdentifier: "AdTableViewCell", for: indexPath) as! AdTableViewCell
            adCell.configureAd(title: data.title)
            
            return adCell
        }
    }
}
