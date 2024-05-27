//
//  AdTableViewCell.swift
//  Assignment_240524
//
//  Created by 김상규 on 5/27/24.
//

import UIKit

class AdTableViewCell: UITableViewCell {
    @IBOutlet var adTitleLabel: UILabel!
    @IBOutlet var adLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configureAdUI()
    }
    
    // AdCell 뷰 전체 UI
    func configureAdUI() {
        
        adTitleLabel.font = .boldSystemFont(ofSize: 18)
        adTitleLabel.textAlignment = .center
        adTitleLabel.backgroundColor = [.systemMint, .lightGray, .yellow, .cyan, .orange].randomElement()
        adTitleLabel.layer.cornerRadius = 10
        adTitleLabel.layer.masksToBounds = true
        adTitleLabel.numberOfLines = 2
        
        adLabel.text = "AD"
        adLabel.font = .systemFont(ofSize: 14)
        adLabel.textAlignment = .center
        adLabel.layer.cornerRadius = 5
        adLabel.layer.masksToBounds = true
        adLabel.backgroundColor = .white
    }
    
    // adTitleLabel의 text 메서드
    func configureAd(title: String) {
        adTitleLabel.text = title
    }
}
