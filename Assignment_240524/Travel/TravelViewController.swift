//
//  TravelViewController.swift
//  Assignment_240524
//
//  Created by 김상규 on 5/27/24.
//

import UIKit

class TravelViewController: UIViewController {
    
    @IBOutlet var cityTableView: UITableView!
    var list = TravelInfo().travel // travel 배열
    var color: UIColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "도시 상세 정보"
        
        tableViewUI()
        
    }
    
    func tableViewUI() {
        // delegate & dataSource 연결
        cityTableView.delegate = self
        cityTableView.dataSource = self
        
        // CityTableViewCell UINib 코드
        let cityXib = UINib(nibName: CityTableViewCell.identifier, bundle: nil)
        cityTableView.register(cityXib, forCellReuseIdentifier: CityTableViewCell.identifier)
        
        // AdTableViewCell UINib 코드
        let adXib = UINib(nibName: AdTableViewCell.identifier, bundle: nil)
        cityTableView.register(adXib, forCellReuseIdentifier: AdTableViewCell.identifier)
    }
}

extension TravelViewController: UITableViewDelegate, UITableViewDataSource {
    
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
        
        if data.ad {
            let adCell = tableView.dequeueReusableCell(withIdentifier: AdTableViewCell.identifier, for: indexPath) as! AdTableViewCell
            adCell.configureAd(title: data.title)
            color = adCell.adTitleLabel.backgroundColor
            
            return adCell

        } else {
            let cityCell = tableView.dequeueReusableCell(withIdentifier: CityTableViewCell.identifier, for: indexPath) as! CityTableViewCell
            cityCell.configureCityCell(data: data)
            cityCell.configureCityCellImgUI(data)
            
            return cityCell
        }

        // 두개의 셀이라는 공간을 미리 담아두고 꺼내쓰는거기에 그렇게 효율적이진 않다...!
        //        let cityCell2 = tableView.dequeueReusableCell(withIdentifier: CityTableViewCell.identifier) as! CityTableViewCell
        //        cityCell2.configureCityCell(data: data)
        //
        //        let adCell2 = tableView.dequeueReusableCell(withIdentifier: AdTableViewCell.identifier) as! AdTableViewCell
        //        adCell2.configureAd(title: data.title)
        //
        //        return data.ad ? adCell2 : cityCell2
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let data = list[indexPath.row]
        
        if data.ad {
            let vc = storyboard?.instantiateViewController(withIdentifier: AdViewController.identifier) as! AdViewController
            vc.advertisement = data
            vc.backgroundColor = color
            
            let nav = UINavigationController(rootViewController: vc)
            
            nav.modalPresentationStyle = .fullScreen
            
            present(nav, animated: true)
            
        } else {
            let sb = UIStoryboard(name: "TravelDetailView", bundle: nil)
            let vc = sb.instantiateViewController(withIdentifier: TravelDetailViewController.identifier) as! TravelDetailViewController
        
            vc.travel = data
            
            navigationController?.pushViewController(vc, animated: true)
        }
        
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
}
