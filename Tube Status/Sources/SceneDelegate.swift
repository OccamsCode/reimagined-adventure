//
//  SceneDelegate.swift
//  Tube Status
//
//  Created by Brian Munjoma on 07/11/2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var appCoordinator: AppCoordinator!

    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            appCoordinator = AppCoordinator(window)
            appCoordinator.start()
        }
    }

}

