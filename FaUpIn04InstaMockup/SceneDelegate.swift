//
//  SceneDelegate.swift
//  FaUpIn04InstaMockup
//
//  Created by joe on 5/13/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windowScene)
        window?.backgroundColor = .systemBackground
        window?.rootViewController = TabBarController()
        window?.tintColor = .label
        window?.makeKeyAndVisible()
    }
}

