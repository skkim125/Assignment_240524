//
//  SearchCountryTableViewCell.swift
//  Assignment_240524
//
//  Created by 김상규 on 5/29/24.
//

import UIKit
import Kingfisher

class SearchCityTableViewCell: UITableViewCell {
    static let identifier = "SearchCityTableViewCell"

    @IBOutlet var searchCityImageView1: UIImageView!
    @IBOutlet var cityNameLabel1: UILabel!
    @IBOutlet var cityExplainLabel1: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        searchCityTableViewCellUI()
    }
    
    func searchCityTableViewCellUI() {
        searchCityImageView1.contentMode = .scaleToFill
        
        cityNameLabel1.font = .systemFont(ofSize: 18, weight: .heavy)
        cityNameLabel1.textColor = .white
        cityNameLabel1.textAlignment = .right
        
        cityExplainLabel1.font = .systemFont(ofSize: 13)
        cityExplainLabel1.backgroundColor = UIColor.black.withAlphaComponent(0.7)
        cityExplainLabel1.textColor = .lightGray
        cityExplainLabel1.textAlignment = .left
    }
    
    
    func searchCityTableViewCell(city: City) {
        let url = URL(string: city.city_image)!
        
        searchCityImageView1.kf.setImage(with: url)
        
        cityNameLabel1.text = "\(city.city_name) | \(city.city_english_name)"
        cityExplainLabel1.text = "\(city.city_explain)"
        
    }
    
    
    
    
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//        
//        
//    }
    
}
