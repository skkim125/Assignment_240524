//
//  CityViewController.swift
//  Assignment_240524
//
//  Created by 김상규 on 5/27/24.
//

import UIKit

class CityViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var cityTableView: UITableView!
    var list = TravelInfo().travel
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        navigationItem.title = "도시 상세 정보" 
        
        
        cityTableView.delegate = self
        cityTableView.dataSource = self
        
        let cityNib = UINib(nibName: "CityTableViewCell", bundle: nil)
        let adNib = UINib(nibName: "AdTableViewCell", bundle: nil)
        cityTableView.register(cityNib, forCellReuseIdentifier: "CityTableViewCell")
        cityTableView.register(adNib, forCellReuseIdentifier: "AdTableViewCell")
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = list[indexPath.row]
        
        if !data.ad {
            let cityCell = tableView.dequeueReusableCell(withIdentifier: "CityTableViewCell", for: indexPath) as! CityTableViewCell
            cityCell.configureCityCell(data: data)
            
            cityTableView.rowHeight = 120
            
            return cityCell
        } else {
            let adCell = tableView.dequeueReusableCell(withIdentifier: "AdTableViewCell", for: indexPath) as! AdTableViewCell
            adCell.configureAd(title: data.title)
            cityTableView.rowHeight = 110
            
            return adCell
        }
        
         //return data.ad ? adCell : cityCell
        
    }
    
}
