//
//  CustomDateFormatter.swift
//  Assignment_240524
//
//  Created by 김상규 on 6/1/24.
//

import Foundation

struct CustomDateFormat {
    func dateFormatTime(date: String) -> String {
        let dateStr = date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        
        let convertDate = dateFormatter.date(from: dateStr)
        
        let timeDateFormatter = DateFormatter()
        timeDateFormatter.dateFormat = "hh:MM a"
        timeDateFormatter.locale = Locale(identifier: "ko_KR")
        
        return timeDateFormatter.string(from: convertDate!)
    }

    func dateFormatDate(date: String) -> String {
        let dateStr = date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        
        let convertDate = dateFormatter.date(from: dateStr)
        
        let timeDateFormatter = DateFormatter()
        timeDateFormatter.dateFormat = "yy.MM.dd"
        timeDateFormatter.locale = Locale(identifier: "ko_KR")
        
        return timeDateFormatter.string(from: convertDate!)
        
    }
}
