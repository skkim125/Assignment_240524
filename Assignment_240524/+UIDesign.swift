//
//  +UIDesign.swift
//  Assignment_240524
//
//  Created by 김상규 on 6/1/24.
//

import UIKit


extension UIView {
    // MARK: - 커스텀 border
    func messageBorder(_ view: UIView, borderColor: CGColor, backgroundColor: UIColor) {
        view.layer.cornerRadius = 12
        view.layer.borderWidth = 0.8
        view.layer.borderColor = borderColor
        view.backgroundColor = backgroundColor
    }
    
    func imageCircleBorder(_ view: UIView, contentMode: UIView.ContentMode, borderColor: CGColor) {
        view.contentMode = contentMode
        view.layer.cornerRadius = view.frame.width / 2
        view.layer.borderColor = borderColor
        view.layer.borderWidth = 0.3
    }
    
    // MARK: - 채팅 메인뷰 UI
    func homeChatUserNameLabelUI(_ label: UILabel) {
        label.font = .systemFont(ofSize: 15, weight: .bold)
        label.numberOfLines = 1
        
    }
    
    func homeChatLastChatLabel(_ label: UILabel) {
        label.font = .systemFont(ofSize: 15)
        label.textColor = .gray
        label.numberOfLines = 1
    }
    
    func homeChatRecentDateLabelUI(_ label: UILabel) {
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.textColor = .lightGray
        label.numberOfLines = 1
    }
    
    // MARK: - 채팅 디테일뷰 UI
    func messageUI(_ messageLabel: UILabel, lines: Int) {
        messageLabel.numberOfLines = lines
        messageLabel.font = .systemFont(ofSize: 16)
    }
    
    func nameLabel(_ nameLabel: UILabel) {
        nameLabel.font = .systemFont(ofSize: 15, weight: .bold)
    }
    
    func dateLabelUI(_ dateLabel: UILabel) {
        dateLabel.font = .systemFont(ofSize: 12)
        dateLabel.textColor = .gray
    }
}
