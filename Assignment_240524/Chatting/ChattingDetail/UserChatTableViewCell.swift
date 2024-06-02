//
//  ChattingDetailTableViewCell.swift
//  Assignment_240524
//
//  Created by 김상규 on 5/31/24.
//

import UIKit

class UserChatTableViewCell: UITableViewCell {
    @IBOutlet var userMessageBackView: UIView!
    @IBOutlet var userImageView: UIImageView!
    @IBOutlet var userNameLabel: UILabel!
    @IBOutlet var userMessageLabel: UILabel!
    @IBOutlet var userMessageDateLabel: UILabel!
    
    var dateFormat = CustomDateFormat()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        userChatDetailTableViewCellUI()
    }

    func userChatDetailTableViewCellUI() {
        
        messageBorder(userMessageBackView, borderColor: UIColor.darkGray.cgColor, backgroundColor: .white)
        imageCircleBorder(userImageView, contentMode: .scaleToFill, borderColor: UIColor.darkGray.cgColor)
        nameLabel(userNameLabel)
        messageUI(userMessageLabel, lines: 0)
        dateLabelUI(userMessageDateLabel)
    }
    
    func userChatTableViewCell(data: Chat) {
        userImageView.image = UIImage(named: data.user.profileImage)
        userNameLabel.text = data.user.rawValue
        userMessageLabel.text = data.message
        userMessageDateLabel.text = dateFormat.dateFormatTime(date: data.date)
    }
    
    
}
