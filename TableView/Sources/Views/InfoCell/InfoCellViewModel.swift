//
//  InfoCellViewModel.swift
//  TableView
//
//  Created by Alexey Zhulikov on 18.03.2020.
//

struct InfoCellViewModel {

    // MARK: - Properties

    private let title: String
    private let value: String

    // MARK: - Initialization

    init(title: String = "", value: String = "") {
        self.title = title
        self.value = value
    }
}

// MARK: - CellViewModel

extension InfoCellViewModel: CellViewModel {

    func setup(_ cell: InfoCell) {
        cell.configure(with: .init(title: title, value: value))
    }
}
