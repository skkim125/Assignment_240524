//
//  ChattingHomeTableViewCell.swift
//  Assignment_240524
//
//  Created by 김상규 on 5/31/24.
//

import UIKit

class ChattingHomeTableViewCell: UITableViewCell {
    @IBOutlet var thumbnailImageView: UIImageView!
    @IBOutlet var friendNameLabel: UILabel!
    @IBOutlet var recentDateLabel: UILabel!
    @IBOutlet var lastChatLabel: UILabel!
    
    var dateFormat = CustomDateFormat()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        chattingHomeTablecellUI()
    }

    func chattingHomeTablecellUI() {
        homeChatUserNameLabelUI(friendNameLabel)
        homeChatRecentDateLabelUI(recentDateLabel)
        homeChatLastChatLabel(lastChatLabel)
        
        thumbnailImageView.clipsToBounds = true
    }
    
    func chattingHomeTablecell(_ data: ChatRoom) {
        guard let lastChat = data.chatList.last else { return }
        
        thumbnailImageView.image = UIImage(named: data.chatroomImage.first ?? "")
        friendNameLabel.text = data.chatroomName
        recentDateLabel.text = dateFormat.dateFormatDate(date: lastChat.date)
        lastChatLabel.text = lastChat.message
        
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        
        imageCircleBorder(thumbnailImageView, contentMode: .scaleToFill, borderColor: UIColor.darkGray.cgColor)
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        backgroundColor = .clear
    }
}
