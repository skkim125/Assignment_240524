//
//  adViewController.swift
//  Assignment_240524
//
//  Created by 김상규 on 5/29/24.
//

import UIKit

class AdViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        adViewNavigationItemsUI()
    }
    
    func adViewNavigationItemsUI() {
        navigationItem.title = "광고 화면"
        let dismiss = UIBarButtonItem(title: "뒤로 가기", image: UIImage(systemName: "xmark"), target: self, action: #selector(dismissButtonClicked))
        dismiss.tintColor = .black
        
        navigationItem.leftBarButtonItem = dismiss
    }

    @objc func dismissButtonClicked() {
        dismiss(animated: true)
    }
    
}
