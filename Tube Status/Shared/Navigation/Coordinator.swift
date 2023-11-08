//
//  Coordinator.swift
//  Tube Status
//
//  Created by Brian Munjoma on 08/11/2023.
//

import Foundation

enum Navigate {
    case toArticle(Article)
    case toPreview(Previewable)
}

protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] { get set }
    func start()
}

extension Coordinator {

    func store(_ coordinator: Coordinator) {
        for element in childCoordinators where element === coordinator {
            return
        }
        childCoordinators.append(coordinator)
    }

    func free(_ coordinator: Coordinator) {
        guard !childCoordinators.isEmpty else { return }
        for (index, element) in childCoordinators.enumerated() where element === coordinator {
            childCoordinators.remove(at: index)
            break
        }
    }
}
