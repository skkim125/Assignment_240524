//
//  MagazineTableViewCell.swift
//  Assignment_240524
//
//  Created by 김상규 on 5/24/24.
//

import UIKit
import Kingfisher

class MagazineTableViewCell: UITableViewCell {
    @IBOutlet var travelImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var subTitleLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    func magazineTableViewCellUI() {
        travelImageView.contentMode = .scaleAspectFill
        travelImageView.layer.cornerRadius = 10
        travelImageView.tintColor = .lightGray
        
        titleLabel.font = .boldSystemFont(ofSize: 20)
        titleLabel.numberOfLines = 2
        
        subTitleLabel.font = .boldSystemFont(ofSize: 16)
        subTitleLabel.textColor = .gray
        subTitleLabel.numberOfLines = 2
        
        dateLabel.font = .boldSystemFont(ofSize: 14)
        dateLabel.textColor = .lightGray
        dateLabel.textAlignment = .right
    }
    
    func magazineTableViewCell(data: Magazine) {
        let url = URL(string: data.photo_image)
        let placeholder = UIImage(systemName: "arrow.clockwise.circle")!
        
        travelImageView.kf.setImage(with: url, placeholder: placeholder)
        
        titleLabel.text = data.title
        
        subTitleLabel.text = data.subtitle
        
        dateLabel.text = dateFormat(data.date)
    }
    
    func dateFormat(_ date: String) -> String {
        let dateStr = date
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "yyMMdd" // DateFormatter()의 dateFormat 설정
        let convertDate = dateFormat.date(from: dateStr) // Date 타입으로 변환

        let myDateFormatter = DateFormatter()
        myDateFormatter.dateFormat = "yy년 MM월 dd일"

        return myDateFormatter.string(from: convertDate!)
    }
}
