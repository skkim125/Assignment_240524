//
//  DetailViewController.swift
//  Assignment_240524
//
//  Created by 김상규 on 5/29/24.
//

import UIKit

class TravelDetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        detailNavigationItemsUI()
    }

    func detailNavigationItemsUI() {
        navigationItem.title = "관광지 화면"
        let back = UIBarButtonItem(title: "뒤로 가기", image: UIImage(systemName: "chevron.left"), target: self, action: #selector(backButtonClicked))
        back.tintColor = .black
        
        navigationItem.leftBarButtonItem = back
    }

    
    @objc func backButtonClicked() {
        navigationController?.popViewController(animated: true)
    }
}
