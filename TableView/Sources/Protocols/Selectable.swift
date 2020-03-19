//
//  Selectable.swift
//  TableView
//
//  Created by Alexey Zhulikov on 19.03.2020.
//

protocol Selectable {
    /// Action that called when item is selected
    var onSelect: () -> Void { get }
}
