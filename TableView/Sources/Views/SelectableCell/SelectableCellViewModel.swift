//
//  SelectableCellViewModel.swift
//  TableView
//
//  Created by Alexey Zhulikov on 18.03.2020.
//

struct SelectableCellViewModel {

    // MARK: - Properties

    private let title: String
    let onSelect: (() -> Void)?

    // MARK: - Initialization

    init(title: String, onSelect: @escaping () -> Void) {
        self.title = title
        self.onSelect = onSelect
    }
}

// MARK: - CellViewModel

extension SelectableCellViewModel: CellViewModel {

    func setup(_ cell: SelectableCell) {
        cell.configure(with: .init(title: title))
    }
}
