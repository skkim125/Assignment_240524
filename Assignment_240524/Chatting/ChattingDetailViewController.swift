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
    var chatName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationTabUI(name: chatName)
        detailTableViewSetting()
    }
    
    func navigationTabUI(name: String?) {
        if let n = name {
            navigationItem.title = "\(n)"
        }
        
        let backButton = UIBarButtonItem(image: UIImage(systemName: "chevron.backward"), style: .plain, target: self, action: #selector(dismissAction))
        backButton.tintColor = .black
        
        navigationItem.leftBarButtonItem = backButton
    }
    
    @objc func dismissAction() {
        navigationController?.popViewController(animated: true)
    }
    
    func detailTableViewSetting() {
        chattingDetailTableView.delegate = self
        chattingDetailTableView.dataSource = self
        chattingDetailTableView.rowHeight = UITableView.automaticDimension
        chattingDetailTableView.separatorStyle = .none
        
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
