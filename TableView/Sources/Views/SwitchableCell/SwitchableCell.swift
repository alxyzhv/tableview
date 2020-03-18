//
//  SwitchableCell.swift
//  TableView
//
//  Created by Alexey Zhulikov on 21.12.2019.
//

import UIKit

final class SwitchableCell: UITableViewCell, Configurable, NibLoadable {

    struct Model {
        let title: String
        let value: Bool
        let onChange: (Bool) -> Void
    }

    // MARK: - Private Properties

    private var onChange: ((Bool) -> Void)?

    // MARK: - Subviews

    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var switchView: UISwitch!

    // MARK: - UIView

    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }

    // MARK: - Configurable

    func configure(with model: Model) {
        titleLabel.text = model.title
        switchView.setOn(model.value, animated: false)
        self.onChange = model.onChange
    }
}

// MARK: - Actions

private extension SwitchableCell {

    @objc func valueChangedAction() {
        onChange?(switchView.isOn)
    }
}

// MARK: - Private Setup

private extension SwitchableCell {

    func setupUI() {
        titleLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        switchView.addTarget(self, action: #selector(valueChangedAction), for: .valueChanged)
    }
}
