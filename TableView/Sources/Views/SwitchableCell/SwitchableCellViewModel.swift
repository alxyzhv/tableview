//
//  SwitchableCellViewModel.swift
//  TableView
//
//  Created by Alexey Zhulikov on 18.03.2020.
//

struct SwitchableCellViewModel {

    // MARK: - Properties

    private let title: String
    private let value: Bool
    private let onChange: (Bool) -> Void

    // MARK: - Initialization

    init(title: String, value: Bool = false, onChange: @escaping (Bool) -> Void) {
        self.title = title
        self.value = value
        self.onChange = onChange
    }
}

// MARK: - CellViewModel

extension SwitchableCellViewModel: CellViewModel {

    func setup(_ cell: SwitchableCell) {
        cell.configure(with: .init(title: title, value: value, onChange: onChange))
    }
}
