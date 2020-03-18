//
//  Configurable.swift
//  TableView
//
//  Created by Alexey Zhulikov on 15.03.2020.
//

protocol Configurable {
    associatedtype Model
    /// Configure view
    func configure(with model: Model)
}
