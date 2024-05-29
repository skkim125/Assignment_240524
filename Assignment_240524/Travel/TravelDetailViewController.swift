//
//  DetailViewController.swift
//  Assignment_240524
//
//  Created by 김상규 on 5/29/24.
//

import UIKit
import Kingfisher

class TravelDetailViewController: UIViewController {

    @IBOutlet var travelImageView: UIImageView!
    @IBOutlet var travelNameLabel: UILabel!
    @IBOutlet var travelDescriptionLabel: UILabel!
    
    var travel: Travel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        detailNavigationItemsUI()
        travelSet(data: travel)
        travelUI()
    }

    func detailNavigationItemsUI() {
        navigationItem.title = "관광지 상세 정보"
        let back = UIBarButtonItem(title: "뒤로 가기", image: UIImage(systemName: "chevron.left"), target: self, action: #selector(backButtonClicked))
        back.tintColor = .black
        
        navigationItem.leftBarButtonItem = back
    }

    
    @objc func backButtonClicked() {
        navigationController?.popViewController(animated: true)
    }
    
    func travelUI() {
        travelImageView.contentMode = .scaleAspectFill
        travelImageView.layer.cornerRadius = 12
        
        travelNameLabel.font = .systemFont(ofSize: 28, weight: .heavy)
        travelNameLabel.textAlignment = .center
        travelNameLabel.numberOfLines = 0
        
        travelDescriptionLabel.font = .systemFont(ofSize: 18)
        travelDescriptionLabel.textColor = .darkGray
        travelDescriptionLabel.textAlignment = .center
        travelDescriptionLabel.numberOfLines = 0
        travelDescriptionLabel.layer.borderWidth = 0.5
        travelDescriptionLabel.layer.borderColor = UIColor.lightGray.cgColor
        travelDescriptionLabel.layer.cornerRadius = 12
    }
    
    func travelSet(data: Travel?) {
        guard let d = data else { return }
        guard let url = URL(string: d.travel_image!) else { return }
        travelImageView.kf.setImage(with: url)
        
        travelNameLabel.text = d.title
        travelDescriptionLabel.text = d.description!
    }
}
