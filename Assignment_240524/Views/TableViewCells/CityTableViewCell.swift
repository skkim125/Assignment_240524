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
    
    func configureCityCellUI() {
        nameLabel.font = .boldSystemFont(ofSize: 18)
        nameLabel.numberOfLines = 2
        descriptionLabel.font = .systemFont(ofSize: 15)
        descriptionLabel.textColor = .gray
        descriptionLabel.numberOfLines = 2
        
        for img in starImages {
            img.image = UIImage(systemName: "star")
            img.tintColor = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
        }
        
        saveLabel.font = .boldSystemFont(ofSize: 14)
        saveLabel.textColor = .lightGray
        
    }
    
    func configureCityCell(data: Travel) {
        guard let g = data.grade else { return }
        nameLabel.text = data.title
        descriptionLabel.text = data.description
        starImages = starFilled(grade: g)
        saveLabel.text = "\u{2022} 저장 \(data.save!)"
        
        guard let img = data.travel_image else { return }
        let url = URL(string: img)!
        travelImageView.kf.setImage(with: url, placeholder: UIImage(systemName: "arrow.clockwise"))
        travelImageView.contentMode = .scaleAspectFill
        
        let likeImg = data.like! ? "heart.fill" : "heart"
        likeButton.setImage(UIImage(systemName: likeImg), for: .normal)
        likeButton.tintColor = .red
    }
    
    func starFilled(grade: Double) -> [UIImageView] {
        let intOfGrade = Int(grade)
        let starFillImg = UIImage(systemName: "star.fill")!
        
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
    
    func setStarFilled(num: Int) -> [UIImageView] {
        var result: [UIImageView] = starImages
        
        for i in 0...num-1 {
            starImages[i].image = UIImage(systemName: "star.fill")
            
            result.append(starImages[i])
        }
        return result
    }
}

//struct Travel {
//    var title: String-
//    var description: String?-
//    var travel_image: String?-
//    var grade: Double?-
//    var save: Int?-
//    var like: Bool?-
//    var ad: Bool
//}
