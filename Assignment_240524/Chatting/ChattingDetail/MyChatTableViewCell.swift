//
//  MyChatTableViewCell.swift
//  Assignment_240524
//
//  Created by 김상규 on 6/1/24.
//

import UIKit

class MyChatTableViewCell: UITableViewCell {
    @IBOutlet var myMessageLabel: UILabel!
    @IBOutlet var myMessageDateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        myChatDetailTableViewCellUI()
    }

    func myChatDetailTableViewCellUI() {
        myMessageLabel.numberOfLines = 0
    }
    
    func myChatTableViewCell(data: Chat) {
        myMessageLabel.text = data.message
        myMessageDateLabel.text = data.date
    }
    
}
