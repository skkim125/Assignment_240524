//
//  MagazineTableViewController.swift
//  Assignment_240524
//
//  Created by 김상규 on 5/24/24.
//

import UIKit
import Kingfisher

class MagazineTableViewController: UITableViewController {

    let magazine = MagazineInfo().magazine
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = 480
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return magazine.count
    }
 
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MagazineTableViewCell") as! MagazineTableViewCell
        
        let url = URL(string: magazine[indexPath.row].photo_image)
        let placeholder = UIImage(systemName: "arrow.clockwise.circle")!
        
        cell.travelImageView.kf.setImage(with: url, placeholder: placeholder)
        cell.travelImageView.contentMode = .scaleAspectFill
        cell.travelImageView.layer.cornerRadius = 10
        cell.travelImageView.tintColor = .lightGray
        
        cell.titleLabel.text = magazine[indexPath.row].title
        cell.titleLabel.font = .boldSystemFont(ofSize: 20)
        cell.titleLabel.numberOfLines = 2
        
        cell.subTitleLabel.text = magazine[indexPath.row].subtitle
        cell.subTitleLabel.font = .boldSystemFont(ofSize: 16)
        cell.subTitleLabel.textColor = .gray
        cell.subTitleLabel.numberOfLines = 2
        
        cell.dateLabel.text = dateFormat(magazine[indexPath.row].date)
        cell.dateLabel.font = .boldSystemFont(ofSize: 14)
        cell.dateLabel.textColor = .lightGray
        cell.dateLabel.textAlignment = .right
        
        return cell
    }
    
    func dateFormat(_ date: String) -> String {
        let dateStr = "230125"
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "yyMMdd" // DateFormatter()의 dateFormat 설정
        let convertDate = dateFormat.date(from: dateStr) // Date 타입으로 변환

        let myDateFormatter = DateFormatter()
        myDateFormatter.dateFormat = "yy년 MM월 dd일"

        return myDateFormatter.string(from: convertDate!)
    }
}
