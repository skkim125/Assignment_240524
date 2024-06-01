//
//  +Extension.swift
//  Assignment_240524
//
//  Created by 김상규 on 5/31/24.
//

import UIKit

extension UIViewController: setIdentifier {
    static var identifier: String {
        String(describing: self)
    }
}

extension UITableViewCell: setIdentifier {
    static var identifier: String {
        String(describing: self)
    }
}

protocol setIdentifier {
    static var identifier: String { get }
}
