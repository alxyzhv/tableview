//
//  NibLoadable.swift
//  TableView
//
//  Created by Alexey Zhulikov on 15.03.2020.
//

import UIKit

protocol NibLoadable {
    /// Nib file associated with view
    static var nib: UINib { get }
}

extension NibLoadable where Self: UITableViewCell {

    static var nib: UINib {
        return UINib(nibName: String(describing: Self.self), bundle: Bundle(for: Self.self))
    }
}
