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

        configureCityCellLabelUI()
    }
    
    // CityCellView 라벨 UI 디자인
    func configureCityCellLabelUI() {
        nameLabel.font = .boldSystemFont(ofSize: 18)
        nameLabel.numberOfLines = 2
        
        descriptionLabel.font = .systemFont(ofSize: 14)
        descriptionLabel.textColor = .lightGray
        descriptionLabel.numberOfLines = 2

        saveLabel.font = .boldSystemFont(ofSize: 13)
        saveLabel.textColor = .lightGray
    }
    
    // CityCellView UI 데이터 디자인
    func configureCityCell(data: Travel) {
        nameLabel.text = data.title
        descriptionLabel.text = data.description
        saveLabel.text = "\u{2022} 저장 \(data.save!)" // \u{2022}: 가운데점 문자열
    }
    
    // CityCellView ImageView UI 데이터 디자인
    func configureCityCellImgUI(_ data: Travel) {
        
        guard let grade = data.grade else { return }
        starImageUI(stars: starImages)
        starImages = starFilled(grade: grade)
        
        guard let img = data.travel_image else { return }
        let url = URL(string: img)!
        travelImageView.kf.setImage(with: url, placeholder: UIImage(systemName: "arrow.clockwise"))
        travelImageView.contentMode = .scaleAspectFill
        travelImageView.layer.cornerRadius = 16
        
        guard let like = data.like else { return }
        let likeImg = like ? "heart.fill" : "heart"
        likeButton.setImage(UIImage(systemName: likeImg), for: .normal)
        likeButton.tintColor = like ? .red : .white
        likeButton.imageView?.contentMode = .scaleAspectFill
    }
    
    // 이미지뷰 cornerRadius 적용해보기
//    override func layoutSubviews() {
//        super.layoutSubviews()
//        
//        travelImageView.layer.cornerRadius = travelImageView.frame.width / 2
//    }
}

// 별점 관련 extension
extension CityTableViewCell {
    
    // 빈 별점 이미지뷰 UI
    func starImageUI(stars: [UIImageView]) {
        for img in stars {
            img.image = UIImage(systemName: "star")
            img.tintColor = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
        }
    }
    
    // 평점에 따른 채워진 별점 배열을 반환하는 로직
    func starFilled(grade: Double) -> [UIImageView] {
        let intGrade = Int(grade)
        
        switch intGrade {
        case 1:
            return setStarFilled(num: 1)
        case 2:
            return setStarFilled(num: 2)
        case 3:
            return setStarFilled(num: 3)
        case 4:
            return setStarFilled(num: 4)
        case 5:
            return setStarFilled(num: 5)
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
    
    override func prepareForReuse() {
        super.prepareForReuse()

        
    }
}
