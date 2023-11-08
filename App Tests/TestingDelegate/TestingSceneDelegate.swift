//
//  TestingSceneDelegate.swift
//  App Tests
//
//  Created by Brian Munjoma on 08/11/2023.
//

import UIKit

class TestingSceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = TestingRootViewController()
        window?.makeKeyAndVisible()
    }
}
