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
    var filterList = mockChatList
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "트래블톡"
        mainTableViewSetting()
        hideKeyboard()
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
        return filterList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = filterList[indexPath.row]
        
        let chatCell = tableView.dequeueReusableCell(withIdentifier: ChattingHomeTableViewCell.identifier, for: indexPath) as! ChattingHomeTableViewCell
        chatCell.chattingHomeTablecell(data)
        
        return chatCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: ChattingDetailViewController.identifier) as! ChattingDetailViewController
        
        vc.chatList = filterList[indexPath.row].chatList
        vc.chatName = filterList[indexPath.row].chatroomName
        
        navigationController?.pushViewController(vc, animated: true)
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
}

extension ChattingViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            filterList = chattingList
            chattingTableView.reloadData()
        } else {
            searchChatRoom(searchText)
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        // searchBar.text와 mockChatList[ChatRoom]의 Chat의 user(string)와 일치해야함
        guard let text = searchBar.text, !text.trimmingCharacters(in: .whitespaces).isEmpty else {
            searchBar.placeholder = "한글자 이상 입력하세요"
            filterList = chattingList
            chattingTableView.reloadData()
            return
        }
        searchChatRoom(text)
        view.endEditing(true)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        filterList = chattingList
        chattingTableView.reloadData()
    }
    
    func searchChatRoom(_ text: String) {
        var chatList: [ChatRoom] = []
        
        for chatRoom in mockChatList {
            if chatRoom.chatroomName.lowercased().contains(text.lowercased()) {
                chatList.append(chatRoom)
            }
        }
        filterList = chatList
        chattingTableView.reloadData()
    }
}

extension UIViewController {
    func hideKeyboard() {
        let touch = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        touch.cancelsTouchesInView = false
        view.addGestureRecognizer(touch)
        navigationController?.navigationBar.addGestureRecognizer(touch)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

extension UITableView {
    
    func hideKeyboard() {
        let touch = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        touch.cancelsTouchesInView = false
        
        self.addGestureRecognizer(touch)
    }
    
    @objc func dismissKeyboard() {
        self.endEditing(true)
    }
}
