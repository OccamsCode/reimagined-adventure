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
    
    init(_ window: UIWindow) {
        childCoordinators = []
    }
    
    func start() {
        
    }
    
    deinit {
        childCoordinators.forEach { free($0) }
    }
}
