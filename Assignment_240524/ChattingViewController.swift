//
//  ChattingViewController.swift
//  Assignment_240524
//
//  Created by 김상규 on 5/31/24.
//

import UIKit

class ChattingViewController: UIViewController {
    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var chattingTableView: UITableView!
    
    let chattingList = mockChatList
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "트래블톡"
        mainTableViewSetting()
    }
    
    func mainTableViewSetting() {
        chattingTableView.delegate = self
        chattingTableView.dataSource = self
        chattingTableView.rowHeight = 80
        chattingTableView.separatorStyle = .none
        
        let xib = UINib(nibName: ChattingHomeTableViewCell.identifier, bundle: nil)
        chattingTableView.register(xib, forCellReuseIdentifier: ChattingHomeTableViewCell.identifier)
    }
    
}

extension ChattingViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chattingList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = chattingList[indexPath.row]
        
        let chatCell = tableView.dequeueReusableCell(withIdentifier: ChattingHomeTableViewCell.identifier, for: indexPath) as! ChattingHomeTableViewCell
        
        chatCell.chattingHomeTablecell(data)
        
        return chatCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: ChattingDetailViewController.identifier) as! ChattingDetailViewController
        
        vc.chatList = chattingList[indexPath.row].chatList
        vc.chatName = chattingList[indexPath.row].chatroomName
        
        navigationController?.pushViewController(vc, animated: true)
    }
}
