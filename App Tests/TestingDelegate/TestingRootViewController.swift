//
//  TestingRootViewController.swift
//  App Tests
//
//  Created by Brian Munjoma on 08/11/2023.
//

import UIKit

class TestingRootViewController: UIViewController {

    override func loadView() {
        let label = UILabel()
        label.text = "Running Unit Tests..."
        label.textAlignment = .center
        label.textColor = .white

        view = label
    }
}
