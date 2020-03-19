//
//  CellViewModel.swift
//  TableView
//
//  Created by Alexey Zhulikov on 17.03.2020.
//

import UIKit

protocol AnyCellViewModel {
    /// Cell class associated with viewModel
    static var cellClass: UITableViewCell.Type { get }
    /// Setup cell
    func setup(_ cell: UITableViewCell)
}

protocol CellViewModel: AnyCellViewModel {
    associatedtype Cell: UITableViewCell
    /// Setup cell
    func setup(_ cell: Cell)
}

extension CellViewModel {

    static var cellClass: UITableViewCell.Type { return Cell.self }

    func setup(_ cell: UITableViewCell) {
        guard let cell = cell as? Cell else { return }
        setup(cell)
    }
}

extension UITableView {

    /// Dequeue and configure cell by cellViewModel
    func dequeueReusableCell(with viewModel: AnyCellViewModel, for indexPath: IndexPath) -> UITableViewCell {
        let cell = dequeueReusableCell(withIdentifier: type(of: viewModel).cellClass.reuseIdentifier, for: indexPath)
        viewModel.setup(cell)
        return cell
    }
}
