//
//  SceneDelegate.swift
//  ToDoListApp
//
//  Created by Alice on 28.07.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        let coordinator = AppCoordinator(navigationController: UINavigationController(), persistenceRepository: PersistenceRepository(persistence: PersistenceService()))
        coordinator.start()
        self.window?.rootViewController = coordinator.navigationController
        self.window?.makeKeyAndVisible()
    }
}

