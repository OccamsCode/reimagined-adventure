//
//  TubeStatusFlowCoordinator.swift
//  Tube Status
//
//  Created by Brian Munjoma on 08/11/2023.
//

import Foundation
import UIKit

final class TubeStatusFlowCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator]
    let navigation: UINavigationController

    init(_ navigationController: UINavigationController) {
        self.navigation = navigationController
        self.childCoordinators = []
    }

    func start() {
        // Create ViewController
        let view = TubeStatusTableViewController()
        
        // Create ViewModel
        
        // Assign ViewModel to ViewController
        navigation.setViewControllers([view], animated: false)
    }
    
}
