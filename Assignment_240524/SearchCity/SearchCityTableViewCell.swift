//
//  SearchCountryTableViewCell.swift
//  Assignment_240524
//
//  Created by 김상규 on 5/29/24.
//

import UIKit
import Kingfisher

class SearchCityTableViewCell: UITableViewCell {
    @IBOutlet var backView: UIView!
    @IBOutlet var searchCityImageView1: UIImageView!
    @IBOutlet var cityNameLabel1: UILabel!
    @IBOutlet var cityExplainLabel1: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        searchCityTableViewCellUI()
    }
    
    func searchCityTableViewCellUI() {
        backView.layer.shadowColor = UIColor.black.cgColor
        backView.layer.shadowOpacity = 0.3
        backView.layer.shadowOffset = CGSize(width: 5, height: 5)
        backView.layer.shadowRadius = 3.0
        backView.layer.cornerRadius = 12
        
        searchCityImageView1.contentMode = .scaleAspectFill
        searchCityImageView1.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMaxYCorner]
        searchCityImageView1.layer.cornerRadius = 12
        searchCityImageView1.clipsToBounds = true
        
        
        cityNameLabel1.font = .systemFont(ofSize: 18, weight: .heavy)
        cityNameLabel1.textColor = .white
        cityNameLabel1.textAlignment = .right
        
        
        cityExplainLabel1.font = .systemFont(ofSize: 14)
        cityExplainLabel1.backgroundColor = UIColor.black.withAlphaComponent(0.7)
        cityExplainLabel1.textColor = .lightGray
        cityExplainLabel1.textAlignment = .left
        cityExplainLabel1.layer.masksToBounds = true
        cityExplainLabel1.layer.maskedCorners = [.layerMaxXMaxYCorner]
        cityExplainLabel1.layer.cornerRadius = 12
        
    }
    
    
    func searchCityTableViewCell(city: City) {
        let url = URL(string: city.city_image)!
        
        searchCityImageView1.kf.setImage(with: url)
        
        cityNameLabel1.text = "\(city.city_name) | \(city.city_english_name)"
        cityExplainLabel1.text = " \(city.city_explain)"
        
    }
    
    
    
    
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//        
//        
//    }
    
}
