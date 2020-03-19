//
//  SettingsViewController.swift
//  TableView
//
//  Created by Alexey Zhulikov on 21.12.2019.
//

import UIKit

final class SettingsViewController: UIViewController {

    // MARK: - Private Properties

    private var cellViewModels: [AnyCellViewModel] = [
        InfoCellViewModel(title: "Username", value: "Alexey"),
        SwitchableCellViewModel(title: "Apple Health") { value in
            let state = value ? "enabled" : "disabled"
            print("Apple Health is \(state)")
        },
        SeparatorCellViewModel(height: 32),
        SelectableCellViewModel(title: "Feedback") { print("show feedback") },
        SelectableCellViewModel(title: "Help") { print("show help") },
    ] {
        didSet {
            tableView.reloadData()
        }
    }

    // MARK: - Subviews

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .white
        tableView.tableFooterView = UIView()
        tableView.backgroundColor = .systemGroupedBackground
        tableView.separatorInset = .zero
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(SelectableCell.self)
        tableView.register(SwitchableCell.self)
        tableView.register(InfoCell.self)
        tableView.register(SeparatorCell.self)
        return tableView
    }()

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}

// MARK: - UITableViewDataSource

extension SettingsViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellViewModels.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let viewModel = cellViewModels[indexPath.row]
        return tableView.dequeueReusableCell(with: viewModel, for: indexPath)
    }
}

// MARK: - UITableViewDelegate

extension SettingsViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewModel = cellViewModels[indexPath.row]
        if let selectableViewModel = viewModel as? Selectable {
            selectableViewModel.onSelect()
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

// MARK: - Private Setup

private extension SettingsViewController {

    func setup() {
        setupLayout()
        setupUI()
    }

    func setupLayout() {
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }

    func setupUI() {
        title = "Settings"
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .systemGroupedBackground
    }
}
