//
//  SeparatorCell.swift
//  TableView
//
//  Created by Alexey Zhulikov on 17.03.2020.
//

import UIKit

private extension CGFloat {
    static let defaultHeight: CGFloat = 16
}

final class SeparatorCell: UITableViewCell, Configurable {

    struct Model {
        let height: CGFloat
        let backgroundColor: UIColor
    }

    // MARK: - Properties

    private var heightConstraint: NSLayoutConstraint?

    // MARK: - Initialization

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }

    @available(*, unavailable, message: "init(coder:) has not been implemented")
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Configurable

    func configure(with model: Model) {
        backgroundColor = model.backgroundColor
        heightConstraint?.constant = model.height
        updateConstraints()
    }
}

// MARK: - Private Setup

private extension SeparatorCell {

    func setup() {
        heightConstraint = contentView.heightAnchor.constraint(equalToConstant: .defaultHeight)
        heightConstraint?.isActive = true
        heightConstraint?.priority = .defaultHigh
        updateConstraints()
    }
}
