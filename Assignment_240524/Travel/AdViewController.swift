//
//  adViewController.swift
//  Assignment_240524
//
//  Created by 김상규 on 5/29/24.
//

import UIKit

class AdViewController: UIViewController {

    @IBOutlet var adTitleLabel: UILabel!
    var backgroundColor: UIColor?
    var advertisement: Travel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        adViewNavigationItemsUI()
    
        guard let color = backgroundColor else { return }
        guard let ad = advertisement else {
            adTitleLabel.text = ""
            return
        }
        view.backgroundColor = color
        adTitleLabel.text = ad.title
        adTitleLabel.textAlignment = .center
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
