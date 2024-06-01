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
        
        // 방법 2) 비동기 작업
        //DispatchQueue.main.async {
        //    self.setScrollBottom()
        //}
    }
    
    // 방법 1) 뷰가 생성되어 화면에 보이기 전 작업을 진행
    // 뷰가 생성되고 화면에 보이기 직전 https://ios-daniel-yang.tistory.com/93
    // "UIVIew" 객체가 모든 서브뷰들의 레이아웃을 변경한 후에 호출되는 메서드
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        setScrollBottom()
    }
    
    func setScrollBottom() {
        guard let chats = chatList else { return }
        let endIndex = IndexPath(row: chats.count - 1, section: 0)
        
        chattingDetailTableView.scrollToRow(at: endIndex, at: .bottom, animated: false)
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
    
    // tableView가 화면에 나타기 전에 실행되는 메서드
    // 스크롤이 되지 않음...
//    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//        guard let chats = chatList else { return }
//        let endIndex = IndexPath(row: chats.endIndex-1, section: 0)
//        
//        print(indexPath.row)
//        tableView.scrollToRow(at: endIndex, at: .bottom, animated: false)
//    }
}
