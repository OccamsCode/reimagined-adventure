//
//  AppCoordinator.swift
//  Tube Status
//
//  Created by Brian Munjoma on 08/11/2023.
//

import Foundation
import UIKit

final class AppCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator]
    let window: UIWindow

    init(_ window: UIWindow) {
        self.window = window
        self.childCoordinators = []
    }
    
    func start() {
        let statusNavigationController = UINavigationController()
        statusNavigationController.setNavigationBarHidden(true, animated: false)
        let tubeStatusFlow = TubeStatusFlowCoordinator(statusNavigationController)

        tubeStatusFlow.start()

        // store child coordinator
        store(tubeStatusFlow)

        // launch the window
        window.rootViewController = statusNavigationController
        window.makeKeyAndVisible()
    }
    
    deinit {
        childCoordinators.forEach { free($0) }
    }
}
