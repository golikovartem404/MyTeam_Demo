//
//  SceneDelegate.swift
//  MyTeam
//
//  Created by User on 21.11.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        let navController = UINavigationController(rootViewController: EmployeeListViewController())
        navController.navigationBar.prefersLargeTitles = false
        navController.navigationBar.isHidden = false
        navController.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.clear]
        window?.rootViewController = navController
        window?.makeKeyAndVisible()
    }]
}

