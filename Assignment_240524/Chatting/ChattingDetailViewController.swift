//
//  ChattingDetailViewController.swift
//  Assignment_240524
//
//  Created by 김상규 on 5/31/24.
//

import UIKit

class ChattingDetailViewController: UIViewController {
    @IBOutlet var chattingDetailTableView: UITableView!
    @IBOutlet var textViewBackView: UIView!
    @IBOutlet var messageTextView: UITextView!
    @IBOutlet var placeholderLabel: UILabel!
    @IBOutlet var sendTextButton: UIButton!
    var chatList: [Chat]?
    var chatName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationTabUI(name: chatName)
        detailTableViewSetting()
        messageTextViewUI()
        messageTextView.isScrollEnabled = false
    }
    
    // 네비게이션바 UI
    func navigationTabUI(name: String?) {
        if let n = name {
            navigationItem.title = "\(n)"
        }
        
        let backButton = UIBarButtonItem(image: UIImage(systemName: "chevron.backward"), style: .plain, target: self, action: #selector(dismissAction))
        backButton.tintColor = .black
        
        navigationItem.leftBarButtonItem = backButton
    }
    
    // 뒤로가기
    @objc func dismissAction() {
        navigationController?.popViewController(animated: true)
    }
    
    // chattingDetailTableView UI
    func detailTableViewSetting() {
        chattingDetailTableView.delegate = self
        chattingDetailTableView.dataSource = self
        chattingDetailTableView.rowHeight = UITableView.automaticDimension
        chattingDetailTableView.separatorStyle = .none
        
        let userChatXib = UINib(nibName: UserChatTableViewCell.identifier, bundle: nil)
        chattingDetailTableView.register(userChatXib, forCellReuseIdentifier: UserChatTableViewCell.identifier)
        
        let myChatXib = UINib(nibName: MyChatTableViewCell.identifier, bundle: nil)
        chattingDetailTableView.register(myChatXib, forCellReuseIdentifier: MyChatTableViewCell.identifier)
        
        chattingDetailTableView.backgroundColor = .lightGray.withAlphaComponent(0.2)
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
    
    // 채팅방 맨 하단으로 이동하는 메서드
    func setScrollBottom() {
        guard let chats = chatList else { return }
        let endIndex = IndexPath(row: chats.count - 1, section: 0)
        
        chattingDetailTableView.scrollToRow(at: endIndex, at: .bottom, animated: false)
    }
    
    // 메세지 입력창 텍스트뷰 UI
    func messageTextViewUI() {
        messageTextView.delegate = self
        
        textViewBackView.backgroundColor = .clear
        textViewBackView.layer.borderColor = UIColor.lightGray.cgColor
        textViewBackView.layer.borderWidth = 0.3
        
        messageTextView.font = .systemFont(ofSize: messageTextView.font!.lineHeight)
        messageTextView.layer.cornerRadius = 8
        messageTextView.layer.borderColor = UIColor.gray.cgColor
        messageTextView.layer.borderWidth = 0.3
        messageTextView.textContainerInset.left = 4
        messageTextView.textContainerInset.right = 4
        
        placeholderLabel.text = "메세지를 입력하세요."
        placeholderLabel.font = .systemFont(ofSize: 18)
        placeholderLabel.textColor = .lightGray
        
        sendTextButton.setImage(UIImage(systemName: "paperplane.fill"), for: .normal)
        sendTextButton.setTitle(nil, for: .normal)
        sendTextButton.tintColor = .white
        sendTextButton.backgroundColor = .systemTeal
        sendTextButton.layer.cornerRadius = 8
        sendTextButton.imageView?.contentMode = .scaleAspectFit
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
                myChatDetailCell.selectionStyle = .none
                myChatDetailCell.backgroundColor = .clear
                return myChatDetailCell
            } else {
                userChatDetailCell.userChatTableViewCell(data: data[indexPath.row])
                userChatDetailCell.selectionStyle = .none
                userChatDetailCell.backgroundColor = .clear
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

extension ChattingDetailViewController: UITextViewDelegate {
    
    // 텍스트뷰 입력 시작하면 placeholder 비우기
//    func textViewDidBeginEditing(_ textView: UITextView) {
//        if textView.text.isEmpty {
//            placeholderLabel.text = ""
//        }
//    }
    
    func textViewDidChange(_ textView: UITextView) {
        let size = CGSize(width: textView.frame.width, height: .infinity)
        let estimatedSize = textView.sizeThatFits(size)
        let numberOfLines = Int(estimatedSize.height / (textView.font!.lineHeight))
        
        textView.constraints.forEach { constraint in
            
            if constraint.firstAttribute == .height && numberOfLines <= 3{
                constraint.constant = estimatedSize.height
            } else if numberOfLines > 3 {
                messageTextView.isScrollEnabled = true
            }
        }
        
        if !textView.text.isEmpty {
            placeholderLabel.text = ""
        } else {
            placeholderLabel.text = "메세지를 입력해주세요."
        }
    }
    
    //    // 텍스트뷰 줄 갯수 확인 메서드
    //    func numberOfLine() -> Int {
    //
    //        let size = CGSize(width: self.frame.width, height: .infinity)
    //        let estimatedSize = sizeThatFits(size)
    //
    //        return Int(estimatedSize.height / (self.font!.lineHeight))
    //    }
}
