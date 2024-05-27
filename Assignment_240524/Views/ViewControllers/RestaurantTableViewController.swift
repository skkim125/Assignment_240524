//
//  RestaurantTableViewController.swift
//  Assignment_240524
//
//  Created by 김상규 on 5/24/24.
//

import UIKit
import Kingfisher

class RestaurantTableViewController: UITableViewController, UISearchBarDelegate {
    @IBOutlet var searchBar: UISearchBar!
    
    var koreanOn = false
    var sortOn = false
    var list = RestaurantList().restaurantArray
    var filteredList = RestaurantList().restaurantArray
    var searchList: [Restaurant] = []
    
    var sortName = "기본 정렬순"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let koreanFood = UIBarButtonItem(title: "한식만", style: .plain, target: self, action: #selector(koreanFoodButtonClicked))
        let sort = UIBarButtonItem(title: sortName, style: .plain, target: self, action: #selector(sortButtonClicked))
        
        navigationItem.leftBarButtonItem = koreanFood
        navigationItem.rightBarButtonItem = sort
        navigationItem.title = "영등포캠퍼스 Food Fighter"
        
        searchBar.delegate = self

        tableView.rowHeight = 190
    }
    
    @objc
    func koreanFoodButtonClicked() {
        koreanOn.toggle()
        
        buttonLogic()
        navigationItem.leftBarButtonItem?.tintColor = koreanOn ? .green : .tintColor
        
        tableView.reloadData()
    }
    
    @objc
    func sortButtonClicked() {
        sortOn.toggle()
        
        buttonLogic()
        navigationItem.rightBarButtonItem?.tintColor = sortOn ? .green : .tintColor
        navigationItem.rightBarButtonItem?.title = sortName
        
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredList.count
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
        let imageUrl = URL(string: filteredList[row].image)
        let placeholder = UIImage(systemName: "arrow.clockwise.circle")
        cell.restaurantImageView.kf.setImage(with: imageUrl, placeholder: placeholder)
        cell.restaurantImageView.contentMode = .scaleToFill
        cell.restaurantImageView.layer.cornerRadius = 8
    }
    
    func categortLabelUI(cell: RestaurantTableViewCell, row: Int) {
        cell.categoryLabel.text = filteredList[row].category
        cell.categoryLabel.font = .boldSystemFont(ofSize: 13)
        cell.categoryLabel.textColor = .darkGray
        cell.categoryLabel.textAlignment = .left
        cell.categoryLabel.sizeToFit()
    }
    
    func restaurantNameLabelUI(cell: RestaurantTableViewCell, row: Int) {
        cell.restaurantNameLabel.text = filteredList[row].name
        cell.restaurantNameLabel.font = .boldSystemFont(ofSize: 17)
        cell.restaurantNameLabel.sizeToFit()
        cell.restaurantNameLabel.adjustsFontSizeToFitWidth = true
        cell.restaurantNameLabel.textAlignment = .left
        cell.restaurantNameLabel.numberOfLines = 0
    }
    
    func addressLabelUI(cell: RestaurantTableViewCell, row: Int) {
        cell.addressLabel.text = filteredList[row].address
        cell.addressLabel.font = .systemFont(ofSize: 12)
        cell.addressLabel.sizeToFit()
        cell.addressLabel.textAlignment = .left
        cell.addressLabel.numberOfLines = 0
    }
    
    func phoneImageAndLabelUI(cell: RestaurantTableViewCell, row: Int) {
        cell.phoneImage.image = UIImage(systemName: "phone.fill")
        cell.phoneImage.contentMode = .scaleAspectFit
        
        cell.phoneLabel.text = filteredList[row].phoneNumber
        cell.phoneLabel.font = .systemFont(ofSize: 12)
        
        cell.priceLabel.text = "\(filteredList[row].price)원~ "
        cell.priceLabel.font = .boldSystemFont(ofSize: 18)
        cell.priceLabel.sizeToFit()
        cell.priceLabel.textAlignment = .right
    }
    
    func priceLabelUI(cell: RestaurantTableViewCell, row: Int) {
        cell.priceLabel.text = "\(filteredList[row].price)원~ "
        cell.priceLabel.font = .boldSystemFont(ofSize: 18)
        cell.priceLabel.sizeToFit()
        cell.priceLabel.textAlignment = .right
    }
    
    func likeButtonUI(cell: RestaurantTableViewCell, row: Int) {
        cell.likeButton.tag = row
        cell.likeButton.addTarget(self, action: #selector(likeButtonClicked), for: .touchUpInside)
        
        let likeImg = filteredList[row].like ? "heart.fill" : "heart"
        cell.likeButton.setImage(UIImage(systemName: likeImg), for: .normal)
        cell.likeButton.tintColor = .red
    }
    
    @objc
    func likeButtonClicked(button: UIButton) {
        filteredList[button.tag].like.toggle()
        
        tableView.reloadRows(at: [IndexPath(row: button.tag, section: 0)], with: .none)
    }
    
    func buttonLogic() {
        
        if koreanOn { // 1. 한식버튼 true
            if sortOn {
                // 1-1. 정렬버튼 true = 한식 정렬 모두
                filteredList = list.filter { $0.category == "한식" }.sorted(by: { $0.price < $1.price })
                sortName = "낮은 가격순"
                
            } else {
                // 1-2. 정렬버튼 false = 한식만
                filteredList = list.filter { $0.category == "한식" }
                sortName = "기본 정렬순"
            }
        } else { // 2. 한식버튼 false
            
            // 2-1. 정렬버튼 true = 정렬만
            if sortOn {
                filteredList = list.sorted(by: { $0.price < $1.price })
                sortName = "낮은 가격순"
            } else {
                // 2-2. 정렬버튼 flase = 기본
                filteredList = list
                sortName = "기본 정렬순"
            }
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchList.removeAll()
        
        for i in filteredList {
            if i.name.contains(searchBar.text!) || i.category.contains(searchBar.text!) { // str.contains() = str에 포함되는 string인가에 대한 조건
                searchList.append(i)
            }
        }
        
        if searchList.isEmpty {
            searchBar.text = ""
            searchBar.placeholder = "검색결과가 없습니다."
        }
        
        filteredList = searchList
        tableView.reloadData()
    }
}
