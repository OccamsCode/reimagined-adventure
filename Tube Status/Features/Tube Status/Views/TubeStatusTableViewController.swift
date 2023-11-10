//
//  TubeStatusTableViewController.swift
//  Tube Status
//
//  Created by Brian Munjoma on 08/11/2023.
//

import UIKit

class TubeStatusTableViewController: UITableViewController {

    var viewModel: TubeStatusViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        precondition(viewModel != nil, "You forgot to attach a ViewModel")
        tableView.register(cellType: TubeStatusTableViewCell.self)
        tableView.separatorColor = .label
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        viewModel.fetchAllStatus { [unowned self] in
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfItems(inSection: section)
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(with: TubeStatusTableViewCell.self, for: indexPath)
        guard let model = viewModel.object(at: indexPath) else { return cell }
        cell.update(using: model)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.setTemplateWithSubviews(viewModel.loadingState == .loading, animated: true, viewBackgroundColor: .systemBackground)
    }
}

}
