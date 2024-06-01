//
//  ChattingDetailTableViewCell.swift
//  Assignment_240524
//
//  Created by 김상규 on 5/31/24.
//

import UIKit

class UserChatTableViewCell: UITableViewCell {
    @IBOutlet var userImageView: UIImageView!
    @IBOutlet var userNameLabel: UILabel!
    @IBOutlet var userMessageLabel: UILabel!
    @IBOutlet var userMessageDateLabel: UILabel!
    
    var chat: Chat?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        userChatDetailTableViewCellUI()
    }

    func userChatDetailTableViewCellUI() {
        userMessageLabel.numberOfLines = 0
    }
    
    func userChatTableViewCell(data: Chat) {
        userImageView.image = UIImage(named: data.user.profileImage)
        userNameLabel.text = data.user.rawValue
        userMessageLabel.text = data.message
        userMessageDateLabel.text = data.date
    }
    
    
}
