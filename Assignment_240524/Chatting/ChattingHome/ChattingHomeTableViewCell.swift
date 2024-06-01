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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        chattingHomeTablecellUI()
        
    }

    func chattingHomeTablecellUI() {
        friendNameLabel.font = .boldSystemFont(ofSize: 15)
        friendNameLabel.numberOfLines = 1
        
        recentDateLabel.font = .systemFont(ofSize: 14)
        recentDateLabel.textColor = .lightGray
        recentDateLabel.numberOfLines = 1
        
        lastChatLabel.font = .systemFont(ofSize: 14)
        lastChatLabel.textColor = .gray
        lastChatLabel.numberOfLines = 1
    }
    
    func chattingHomeTablecell(_ data: ChatRoom) {
        thumbnailImageView.image = UIImage(named: data.chatroomImage[0])
        
        friendNameLabel.text = data.chatroomName
        
        recentDateLabel.text = data.chatList.last!.date
        
        lastChatLabel.text = data.chatList.last!.message
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        thumbnailImageView.clipsToBounds = true
        thumbnailImageView.layer.cornerRadius = thumbnailImageView.frame.width / 2
    }
}
