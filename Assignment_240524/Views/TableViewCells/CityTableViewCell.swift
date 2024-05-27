//
//  CityTableViewCell.swift
//  Assignment_240524
//
//  Created by 김상규 on 5/27/24.
//

import UIKit

// Intrinsic Content size
class CityTableViewCell: UITableViewCell {

    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var starImages: [UIImageView]!
    @IBOutlet var saveLabel: UILabel!
    @IBOutlet var travelImageView: UIImageView!
    @IBOutlet var likeButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configureCityCellUI()
    }
    
    // CityCellView UI 디자인
    func configureCityCellUI() {
        nameLabel.font = .boldSystemFont(ofSize: 18)
        nameLabel.numberOfLines = 2
        
        descriptionLabel.font = .systemFont(ofSize: 15)
        descriptionLabel.textColor = .gray
        descriptionLabel.numberOfLines = 2
        
        starImageUI(stars: starImages)

        saveLabel.font = .boldSystemFont(ofSize: 14)
        saveLabel.textColor = .lightGray
        
    }
    
    // CityCellView UI 데이터 디자인
    func configureCityCell(data: Travel) {
        guard let g = data.grade else { return }
        nameLabel.text = data.title
        descriptionLabel.text = data.description
        starImages = starFilled(grade: g)
        saveLabel.text = "\u{2022} 저장 \(data.save!)" // \u{2022}: 가운데점 문자열
        
        guard let img = data.travel_image else { return }
        let url = URL(string: img)!
        travelImageView.kf.setImage(with: url, placeholder: UIImage(systemName: "arrow.clockwise"))
        travelImageView.contentMode = .scaleAspectFill
        
        let likeImg = data.like! ? "heart.fill" : "heart"
        likeButton.setImage(UIImage(systemName: likeImg), for: .normal)
        likeButton.tintColor = .red
    }
    
    // 빈 별점 이미지뷰 UI
    func starImageUI(stars: [UIImageView]) {
        for img in stars {
            img.image = UIImage(systemName: "star")
            img.tintColor = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
        }
    }
    
    // 평점에 따른 채워진 별점 배열을 반환하는 로직
    func starFilled(grade: Double) -> [UIImageView] {
        let intOfGrade = Int(grade)
        
        switch intOfGrade {
        case 1:
            return setStarFilled(num: intOfGrade)
        case 2:
            return setStarFilled(num: intOfGrade)
        case 3:
            return setStarFilled(num: intOfGrade)
        case 4:
            return setStarFilled(num: intOfGrade)
        case 5:
            return setStarFilled(num: intOfGrade)
        default:
            return starImages
        }

    }
    
    // 첫(좌측) 이미지부터 Int(평점)의 개수만큼 채워진 별점 이미지로 바꾸어 배열로 반환하는 로직
    func setStarFilled(num: Int) -> [UIImageView] {
        var result: [UIImageView] = starImages
        
        for i in 0...num-1 {
            starImages[i].image = UIImage(systemName: "star.fill")
            
            result.append(starImages[i])
        }
        
        return result
    }
}
