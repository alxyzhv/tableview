//
//  SeparatorCellViewModel.swift
//  TableView
//
//  Created by Alexey Zhulikov on 18.03.2020.
//

import UIKit

struct SeparatorCellViewModel {

    // MARK: - Properties

    private let height: CGFloat
    private let backgroundColor: UIColor

    // MARK: - Initialization

    init(height: CGFloat, backgroundColor: UIColor = .clear) {
        self.height = height
        self.backgroundColor = backgroundColor
    }
}

// MARK: - CellViewModel

extension SeparatorCellViewModel: CellViewModel {

    func setup(_ cell: SeparatorCell) {
        cell.configure(with: .init(height: height, backgroundColor: backgroundColor))
    }
}
