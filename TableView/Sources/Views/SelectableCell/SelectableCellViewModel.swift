//
//  SelectableCellViewModel.swift
//  TableView
//
//  Created by Alexey Zhulikov on 18.03.2020.
//

struct SelectableCellViewModel: Selectable {

    // MARK: - Properties

    let onSelect: () -> Void
    private let title: String

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
