//
//  InfoCell.swift
//  TableView
//
//  Created by Alexey Zhulikov on 21.12.2019.
//

import UIKit

final class InfoCell: UITableViewCell, Configurable {

    struct Model {
        let title: String
        let value: String
    }

    // MARK: - Subviews

    private let titleLabel = UILabel()
    private let valueLabel = UILabel()

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
        titleLabel.text = model.title
        valueLabel.text = model.value
    }
}

// MARK: - Private Setup

private extension InfoCell {

    func setup() {
        setupLayout()
        setupUI()
    }

    func setupLayout() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(valueLabel)

        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            titleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16),
            titleLabel.rightAnchor.constraint(equalTo: valueLabel.leftAnchor, constant: -16),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
        ])
        titleLabel.setContentHuggingPriority(.defaultLow, for: .horizontal)

        valueLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            valueLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            valueLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16)
        ])
        valueLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
    }

    func setupUI() {
        titleLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        valueLabel.font = UIFont.systemFont(ofSize: 16, weight: .light)
    }
}
