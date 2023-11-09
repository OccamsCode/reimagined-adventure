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

    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfItems(inSection: section)
    }

}
