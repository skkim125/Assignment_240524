//
//  ChattingDetailViewController.swift
//  Assignment_240524
//
//  Created by 김상규 on 5/31/24.
//

import UIKit

class ChattingDetailViewController: UIViewController {
    @IBOutlet var chattingDetailTableView: UITableView!
    var chatList: [Chat]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "대화"
        
        chattingDetailTableView.delegate = self
        chattingDetailTableView.dataSource = self
        chattingDetailTableView.rowHeight = UITableView.automaticDimension
        
        let userChatXib = UINib(nibName: UserChatTableViewCell.identifier, bundle: nil)
        chattingDetailTableView.register(userChatXib, forCellReuseIdentifier: UserChatTableViewCell.identifier)
        
        let myChatXib = UINib(nibName: MyChatTableViewCell.identifier, bundle: nil)
        chattingDetailTableView.register(myChatXib, forCellReuseIdentifier: MyChatTableViewCell.identifier)
    }
    
}


extension ChattingDetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let data = chatList {
            return data.count
        }
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let userChatDetailCell = tableView.dequeueReusableCell(withIdentifier: UserChatTableViewCell.identifier, for: indexPath) as! UserChatTableViewCell
        
        let myChatDetailCell = tableView.dequeueReusableCell(withIdentifier: MyChatTableViewCell.identifier, for: indexPath) as! MyChatTableViewCell
        
        if let data = chatList {
            if data[indexPath.row].user == .user {
                myChatDetailCell.myChatTableViewCell(data: data[indexPath.row])
                return myChatDetailCell
            } else {
                userChatDetailCell.userChatTableViewCell(data: data[indexPath.row])
                return userChatDetailCell
            }
            
        }
        
        return userChatDetailCell
    }
    
    
}
