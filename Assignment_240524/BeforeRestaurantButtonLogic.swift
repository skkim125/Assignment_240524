//
//  BeforeRestaurantButtonLogic.swift
//  Assignment_240524
//
//  Created by 김상규 on 5/27/24.
//

//import Foundation


//    func sortButtonUI(sortName: String) {
//        sortButton.setTitle(sortName, for: .normal)
//        sortButton.setImage(UIImage(systemName: "chevron.down"), for: .normal)
//        sortButton.titleLabel?.font = .boldSystemFont(ofSize: 12)
//    }

//    @objc
//    func sortButtonClicked() {
//        sortBool.toggle()
//        buttonLogic()
//
//        tableView.reloadData()
//    }

//    func koreanFoodButtonUI(button: UIButton, color: UIColor, backgroundColor: UIColor) {
//        button.setTitle("한식", for: .normal)
//        button.setTitleColor(color, for: .normal)
//        button.backgroundColor = backgroundColor
//        button.layer.borderWidth = 2
//        button.layer.cornerRadius = 8
//
//        button.addTarget(self, action: #selector(koreanFoodButtonClicked), for: .touchUpInside)
//    }

//    @objc
//    func koreanFoodButtonClicked() {
//        isKoreanButtonClicked.toggle()
//        buttonLogic()
//
//        tableView.reloadData()
//    }

//    func buttonLogic() {
//
//        if isKoreanButtonClicked { // 1. 한식버튼 true
//            if sortBool {
//                // 1-1. 정렬버튼 true = 한식 정렬 모두
//                list = RestaurantList().restaurantArray.filter { $0.category == "한식" }.sorted(by: { $0.price < $1.price })
//                sortButtonUI(sortName: "낮은 가격순")
//                koreanFoodButtonUI(button: koreanFoodButton, color: .white, backgroundColor: .black)
//
//            } else {
//                // 1-2. 정렬버튼 false = 한식만
//                list = RestaurantList().restaurantArray.filter { $0.category == "한식" }
//                sortButtonUI(sortName: "기본 정렬순")
//                koreanFoodButtonUI(button: koreanFoodButton, color: .white, backgroundColor: .black)
//            }
//        } else { // 2. 한식버튼 false
//
//            // 2-1. 정렬버튼 true = 정렬만
//            if sortBool {
//                list = RestaurantList().restaurantArray.sorted(by: { $0.price < $1.price })
//                sortButtonUI(sortName: "낮은 가격순")
//                koreanFoodButtonUI(button: koreanFoodButton, color: .black, backgroundColor: .white)
//            } else {
//                // 2-2. 정렬버튼 flase = 기본
//                list = RestaurantList().restaurantArray
//                sortButtonUI(sortName: "기본 정렬순")
//                koreanFoodButtonUI(button: koreanFoodButton, color: .black, backgroundColor: .white)
//            }
//        }
//    }


//import UIKit
//import Kingfisher
//
//class RestaurantTableViewController: UITableViewController {
//
//    var koreanOn = false
//    var lowPriceOn = false
//    var list = RestaurantList().restaurantArray
//    var filterdList = RestaurantList().restaurantArray
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        let koreanFood = UIBarButtonItem(title: "한식", style: .plain, target: self, action: #selector(koreanFoodButtonClicked))
//        
//        let lowPrice = UIBarButtonItem(title: "가격낮은순", style: .plain, target: self, action: #selector(lowPriceButtonClicked))
//        
//        let sort = UIBarButtonItem(title: sortName, style: .plain, target: self, action: #selector(reset))
//        
//        navigationItem.leftBarButtonItems = [koreanFood, lowPrice]
//        navigationItem.rightBarButtonItem = sort
//        navigationItem.title = "새싹 Food Fighter"
//        
//        tableView.rowHeight = 190
//    }
//    
//    @objc
//    func koreanFoodButtonClicked() {
//        koreanOn.toggle()
//        
//        buttonLogic()
//        navigationItem.leftBarButtonItem?.tintColor = koreanOn ? .green : .tintColor
//        
//        tableView.reloadData()
//    }
//    
//    @objc
//    func lowPriceButtonClicked() {
//        lowPriceOn.toggle()
//        
//        buttonLogic()
//        navigationItem.rightBarButtonItem?.tintColor = lowPriceOn ? .green : .tintColor
//        tableView.reloadData()
//    }
//    
//    @objc
//    func reset() {
//        koreanOn = false
//        lowPriceOn = false
//        
//        navigationItem.leftBarButtonItem?.tintColor = .tintColor
//        navigationItem.rightBarButtonItem?.tintColor = .tintColor
//        
//        tableView.reloadData()
//    }
//    
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return filterdList.count
//    }
//    
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "RestaurantTableViewCell", for: indexPath) as! RestaurantTableViewCell
//        
//        restaurantImageViewUI(cell: cell, row: indexPath.row)
//        categortLabelUI(cell: cell, row: indexPath.row)
//        restaurantNameLabelUI(cell: cell, row: indexPath.row)
//        addressLabelUI(cell: cell, row: indexPath.row)
//        phoneImageAndLabelUI(cell: cell, row: indexPath.row)
//        priceLabelUI(cell: cell, row: indexPath.row)
//        likeButtonUI(cell: cell, row: indexPath.row)
//        
//        return cell
//    }
//    
//    func restaurantImageViewUI(cell: RestaurantTableViewCell, row: Int) {
//        let imageUrl = URL(string: filterdList[row].image)
//        let placeholder = UIImage(systemName: "arrow.clockwise.circle")
//        cell.restaurantImageView.kf.setImage(with: imageUrl, placeholder: placeholder)
//        cell.restaurantImageView.contentMode = .scaleToFill
//        cell.restaurantImageView.layer.cornerRadius = 8
//    }
//    
//    func categortLabelUI(cell: RestaurantTableViewCell, row: Int) {
//        cell.categoryLabel.text = filterdList[row].category
//        cell.categoryLabel.font = .boldSystemFont(ofSize: 13)
//        cell.categoryLabel.textColor = .darkGray
//        cell.categoryLabel.textAlignment = .left
//        cell.categoryLabel.sizeToFit()
//    }
//    
//    func restaurantNameLabelUI(cell: RestaurantTableViewCell, row: Int) {
//        cell.restaurantNameLabel.text = filterdList[row].name
//        cell.restaurantNameLabel.font = .boldSystemFont(ofSize: 17)
//        cell.restaurantNameLabel.sizeToFit()
//        cell.restaurantNameLabel.adjustsFontSizeToFitWidth = true
//        cell.restaurantNameLabel.textAlignment = .left
//        cell.restaurantNameLabel.numberOfLines = 0
//    }
//    
//    func addressLabelUI(cell: RestaurantTableViewCell, row: Int) {
//        cell.addressLabel.text = filterdList[row].address
//        cell.addressLabel.font = .systemFont(ofSize: 12)
//        cell.addressLabel.sizeToFit()
//        cell.addressLabel.textAlignment = .left
//        cell.addressLabel.numberOfLines = 0
//    }
//    
//    func phoneImageAndLabelUI(cell: RestaurantTableViewCell, row: Int) {
//        cell.phoneImage.image = UIImage(systemName: "phone.fill")
//        cell.phoneImage.contentMode = .scaleAspectFit
//        
//        cell.phoneLabel.text = filterdList[row].phoneNumber
//        cell.phoneLabel.font = .systemFont(ofSize: 12)
//        
//        cell.priceLabel.text = "\(filterdList[row].price)원~ "
//        cell.priceLabel.font = .boldSystemFont(ofSize: 18)
//        cell.priceLabel.sizeToFit()
//        cell.priceLabel.textAlignment = .right
//    }
//    
//    func priceLabelUI(cell: RestaurantTableViewCell, row: Int) {
//        cell.priceLabel.text = "\(filterdList[row].price)원~ "
//        cell.priceLabel.font = .boldSystemFont(ofSize: 18)
//        cell.priceLabel.sizeToFit()
//        cell.priceLabel.textAlignment = .right
//    }
//    
//    func likeButtonUI(cell: RestaurantTableViewCell, row: Int) {
//        cell.likeButton.tag = row
//        cell.likeButton.addTarget(self, action: #selector(likeButtonClicked), for: .touchUpInside)
//        
//        let likeImg = filterdList[row].like ? "heart.fill" : "heart"
//        cell.likeButton.setImage(UIImage(systemName: likeImg), for: .normal)
//        cell.likeButton.tintColor = .red
//    }
//    
//    @objc
//    func likeButtonClicked(button: UIButton) {
//        filterdList[button.tag].like.toggle()
//        
//        tableView.reloadRows(at: [IndexPath(row: button.tag, section: 0)], with: .none)
//    }
//    
//    func buttonLogic() {
//        if koreanOn { // 1. 한식버튼 true
//            if lowPriceOn {
//                // 1-1. 정렬버튼 true = 한식 정렬 모두
//                filterdList = list.filter { $0.category == "한식" }.sorted(by: { $0.price < $1.price })
//                
//            } else {
//                // 1-2. 정렬버튼 false = 한식만
//                filterdList = list.filter { $0.category == "한식" }
//            }
//        } else { // 2. 한식버튼 false
//            
//            // 2-1. 정렬버튼 true = 정렬만
//            if lowPriceOn {
//                filterdList = list.sorted(by: { $0.price < $1.price })
//            } else {
//                // 2-2. 정렬버튼 flase = 기본
//                filterdList = list
//            }
//        }
//    }
//}
