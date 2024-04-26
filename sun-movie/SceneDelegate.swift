//
//  SceneDelegate.swift
//  sun-movie
//
//  Created by Duy Nguyễn on 26/04/2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
       
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        self.window = window
        showTabBar(window: window)
    }
}

extension SceneDelegate {
    private func showTabBar(window: UIWindow?) {
        guard let window = window else { return }
        let vc = TabBarViewController()
        window.rootViewController = vc
        window.makeKeyAndVisible()
    }
}
