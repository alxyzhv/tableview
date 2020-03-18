//
//  UITableView.swift
//  TableView
//
//  Created by Alexey Zhulikov on 15.03.2020.
//

import UIKit

extension UITableView {

    /// Register a class for use in creating new table cells
    func register<T: UITableViewCell>(_ cellClass: T.Type) {
        register(cellClass, forCellReuseIdentifier: cellClass.reuseIdentifier)
    }

    /// Register a class with nib file for use in creating new table cells
    func register<T: UITableViewCell>(_ cellClass: T.Type) where T: NibLoadable {
        register(cellClass.nib, forCellReuseIdentifier: cellClass.reuseIdentifier)
    }

    /// Register a cell for cellViewModel
    func register(_ cellViewModel: AnyCellViewModel) {
        register(type(of: cellViewModel).cellClass)
    }
}
