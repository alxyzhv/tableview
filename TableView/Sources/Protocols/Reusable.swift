//
//  Reusable.swift
//  TableView
//
//  Created by Alexey Zhulikov on 15.03.2020.
//

import UIKit

protocol Reusable {
    /// A string used to identify reusable view
    static var reuseIdentifier: String { get }
}

extension Reusable {

    static var reuseIdentifier: String {
        String(describing: self)
    }
}

extension UITableViewCell: Reusable {}
