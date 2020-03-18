//
//  SelectableCell.swift
//  TableView
//
//  Created by Alexey Zhulikov on 21.12.2019.
//

import UIKit

final class SelectableCell: UITableViewCell, Configurable, NibLoadable {

    struct Model {
        let title: String
    }

    // MARK: - Subviews

    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var iconView: UIImageView!

    // MARK: - UIView

    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }

    // MARK: - Configurable

    func configure(with model: Model) {
        titleLabel.text = model.title
    }
}

// MARK: - Private Setup

private extension SelectableCell {

    func setupUI() {
        titleLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        iconView.image = UIImage(named: "arrow")
    }
}
