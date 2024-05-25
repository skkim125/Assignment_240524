//
//  RestaurantTableViewController.swift
//  Assignment_240524
//
//  Created by 김상규 on 5/24/24.
//

import UIKit
import Kingfisher

class RestaurantTableViewController: UITableViewController {
    @IBOutlet var sortButton: UIButton!
    
    var list = RestaurantList().restaurantArray
    
    var sortBool: Bool = false
    var sortName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "영등포캠퍼스 Food Fighter"
        tableView.rowHeight = 190

        sortName = "기본 정렬순"
        sortButtonUI(sortName: "\(sortName)")
        sortButton.addTarget(self, action: #selector(sortButtonClicked), for: .touchUpInside)
    
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RestaurantTableViewCell", for: indexPath) as! RestaurantTableViewCell
        
        restaurantImageViewUI(cell: cell, row: indexPath.row)
        categortLabelUI(cell: cell, row: indexPath.row)
        restaurantNameLabelUI(cell: cell, row: indexPath.row)
        addressLabelUI(cell: cell, row: indexPath.row)
        phoneImageAndLabelUI(cell: cell, row: indexPath.row)
        priceLabelUI(cell: cell, row: indexPath.row)
        likeButtonUI(cell: cell, row: indexPath.row)
        
        return cell
    }
    
    func restaurantImageViewUI(cell: RestaurantTableViewCell, row: Int) {
        let imageUrl = URL(string: list[row].image)
        let placeholder = UIImage(systemName: "arrow.clockwise.circle")
        cell.restaurantImageView.kf.setImage(with: imageUrl, placeholder: placeholder)
        cell.restaurantImageView.contentMode = .scaleToFill
        cell.restaurantImageView.layer.cornerRadius = 8
    }
    
    func categortLabelUI(cell: RestaurantTableViewCell, row: Int) {
        cell.categoryLabel.text = list[row].category
        cell.categoryLabel.font = .boldSystemFont(ofSize: 13)
        cell.categoryLabel.textColor = .darkGray
        cell.categoryLabel.textAlignment = .left
        cell.categoryLabel.sizeToFit()
    }
    
    func restaurantNameLabelUI(cell: RestaurantTableViewCell, row: Int) {
        cell.restaurantNameLabel.text = list[row].name
        cell.restaurantNameLabel.font = .boldSystemFont(ofSize: 17)
        cell.restaurantNameLabel.sizeToFit()
        cell.restaurantNameLabel.adjustsFontSizeToFitWidth = true
        cell.restaurantNameLabel.textAlignment = .left
        cell.restaurantNameLabel.numberOfLines = 0
    }
    
    func addressLabelUI(cell: RestaurantTableViewCell, row: Int) {
        cell.addressLabel.text = list[row].address
        cell.addressLabel.font = .systemFont(ofSize: 12)
        cell.addressLabel.sizeToFit()
        cell.addressLabel.textAlignment = .left
        cell.addressLabel.numberOfLines = 0
    }
    
    func phoneImageAndLabelUI(cell: RestaurantTableViewCell, row: Int) {
        cell.phoneImage.image = UIImage(systemName: "phone.fill")
        cell.phoneImage.contentMode = .scaleAspectFit
        
        cell.phoneLabel.text = list[row].phoneNumber
        cell.phoneLabel.font = .systemFont(ofSize: 12)
        
        cell.priceLabel.text = "\(list[row].price)원~ "
        cell.priceLabel.font = .boldSystemFont(ofSize: 18)
        cell.priceLabel.sizeToFit()
        cell.priceLabel.textAlignment = .right
    }
    
    func priceLabelUI(cell: RestaurantTableViewCell, row: Int) {
        cell.priceLabel.text = "\(list[row].price)원~ "
        cell.priceLabel.font = .boldSystemFont(ofSize: 18)
        cell.priceLabel.sizeToFit()
        cell.priceLabel.textAlignment = .right
    }
    
    func likeButtonUI(cell: RestaurantTableViewCell, row: Int) {
        cell.likeButton.tag = row
        cell.likeButton.addTarget(self, action: #selector(likeButtonToggled), for: .touchUpInside)
        
        let likeImg = list[row].like ? "heart.fill" : "heart"
        cell.likeButton.setImage(UIImage(systemName: likeImg), for: .normal)
        cell.likeButton.tintColor = .red
    }
    
    @objc
    func likeButtonToggled(button: UIButton) {
        list[button.tag].like.toggle()
        
        tableView.reloadRows(at: [IndexPath(row: button.tag, section: 0)], with: .none)
    }
    
    func sortButtonUI(sortName: String) {
        sortButton.setTitle(sortName, for: .normal)
        sortButton.setImage(UIImage(systemName: "chevron.down"), for: .normal)
        sortButton.titleLabel?.font = .boldSystemFont(ofSize: 12)
    }
    
    @objc
    func sortButtonClicked() {
        sortBool.toggle()
        
        if sortBool {
            sortButtonUI(sortName: "낮은 가격순")
            list.sort(by: { $0.price < $1.price })
            
        } else {
            sortButtonUI(sortName: "기본 정렬순")
            list = RestaurantList().restaurantArray
            
        }
        tableView.reloadData()
    }
    
}
