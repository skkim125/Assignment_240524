//
//  MyChatTableViewCell.swift
//  Assignment_240524
//
//  Created by 김상규 on 6/1/24.
//

import UIKit

class MyChatTableViewCell: UITableViewCell {
    @IBOutlet var myMessageBackView: UIView!
    @IBOutlet var myMessageLabel: UILabel!
    @IBOutlet var myMessageDateLabel: UILabel!
    
    var dateFormat = CustomDateFormat()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        myChatDetailTableViewCellUI()
    }

    func myChatDetailTableViewCellUI() {
        messageBorder(myMessageBackView, borderColor: UIColor.darkGray.cgColor, backgroundColor: .lightGray.withAlphaComponent(0.3))
        messageUI(myMessageLabel, lines: 0)
        dateLabelUI(myMessageDateLabel)
    }
    
    func myChatTableViewCell(data: Chat) {
        myMessageLabel.text = data.message
        myMessageDateLabel.text = dateFormat.dateFormatTime(date: data.date)
    }
    
}
