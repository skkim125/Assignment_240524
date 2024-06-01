//
//  BeforeCodeOfResturantTableVIew.swift
//  Assignment_240524
//
//  Created by 김상규 on 5/25/24.
//

// import Foundation

//        let imageUrl = URL(string: list[indexPath.row].image)
//        let placeholder = UIImage(systemName: "arrow.clockwise.circle")
//        cell.restaurantImageView.kf.setImage(with: imageUrl, placeholder: placeholder)
//        cell.restaurantImageView.contentMode = .scaleToFill
//        cell.restaurantImageView.layer.cornerRadius = 8
        
//        cell.categoryLabel.text = list[indexPath.row].category
//        cell.categoryLabel.font = .boldSystemFont(ofSize: 13)
//        cell.categoryLabel.textColor = .darkGray
//        cell.categoryLabel.textAlignment = .left
//        cell.categoryLabel.sizeToFit()
        
//        cell.restaurantNameLabel.text = list[indexPath.row].name
//        cell.restaurantNameLabel.font = .boldSystemFont(ofSize: 17)
//        cell.restaurantNameLabel.sizeToFit()
//        cell.restaurantNameLabel.adjustsFontSizeToFitWidth = true
//        cell.restaurantNameLabel.textAlignment = .left
//        cell.restaurantNameLabel.numberOfLines = 0
        
//        cell.addressLabel.text = list[indexPath.row].address
//        cell.addressLabel.font = .systemFont(ofSize: 12)
//        cell.addressLabel.sizeToFit()
//        cell.addressLabel.textAlignment = .left
//        cell.addressLabel.numberOfLines = 0
        
//        cell.phoneImage.image = UIImage(systemName: "phone.fill")
//        cell.phoneImage.contentMode = .scaleAspectFit
//
//        cell.phoneLabel.text = list[indexPath.row].phoneNumber
//        cell.phoneLabel.font = .systemFont(ofSize: 12)
        
//        cell.priceLabel.text = "\(list[indexPath.row].price)원~ "
//        cell.priceLabel.font = .boldSystemFont(ofSize: 18)
//        cell.priceLabel.sizeToFit()
//        cell.priceLabel.textAlignment = .right
        
//        cell.likeButton.tag = indexPath.row
//        cell.likeButton.addTarget(self, action: #selector(likeButtonToggled), for: .touchUpInside)
//
//        let likeImg = list[indexPath.row].like ? "heart.fill" : "heart"
//        cell.likeButton.setImage(UIImage(systemName: likeImg), for: .normal)
//        cell.likeButton.tintColor = .red


//func detailTableViewSetting() {
//    chattingDetailTableView.delegate = self
//    chattingDetailTableView.dataSource = self
//    chattingDetailTableView.rowHeight = UITableView.automaticDimension
//    chattingDetailTableView.separatorStyle = .none
//    
//    let userChatXib = UINib(nibName: UserChatTableViewCell.identifier, bundle: nil)
//    chattingDetailTableView.register(userChatXib, forCellReuseIdentifier: UserChatTableViewCell.identifier)
//    
//    let myChatXib = UINib(nibName: MyChatTableViewCell.identifier, bundle: nil)
//    chattingDetailTableView.register(myChatXib, forCellReuseIdentifier: MyChatTableViewCell.identifier)
//    
//    // 방법 2) 비동기 작업
//    DispatchQueue.main.async {
//        self.setScrollBottom()
//        print("=======")
//    }
//}
//
//
//override func viewWillAppear(_ animated: Bool) {
//    print(#function)
//}
//
//override func loadViewIfNeeded() {
//    super.loadViewIfNeeded()
//    print(#function)
//    
//}
//
//override func viewIsAppearing(_ animated: Bool) {
//    print(#function)
//}
//
//override func viewWillLayoutSubviews() {
//    print(#function)
//}
//
//// 방법 1) 뷰가 생성되어 화면에 보이기 전 작업을 진행
//// 뷰가 생성되고 화면에 보이기 직전 https://ios-daniel-yang.tistory.com/93
//// "UIVIew" 객체가 모든 서브뷰들의 레이아웃을 변경한 후에 호출되는 메서드
//override func viewDidLayoutSubviews() {
//    super.viewDidLayoutSubviews()
//    print(#function)
//    
////        setScrollBottom()
//}
//
//override func viewDidAppear(_ animated: Bool) {
//    print(#function)
//}
//
//override func viewWillDisappear(_ animated: Bool) {
//    print(#function)
//}
//
//override func viewDidDisappear(_ animated: Bool) {
//    print(#function)
//}
//
//func setScrollBottom() {
//    guard let chats = chatList else { return }
//    let endIndex = IndexPath(row: chats.count - 1, section: 0)
//    
//    chattingDetailTableView.scrollToRow(at: endIndex, at: .bottom, animated: false)
//}
