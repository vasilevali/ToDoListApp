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
        let window = UIWindow(windowScene: windowScene)
//        let viewController = MainViewController(viewModel: MainViewModel(repository: PersistenceRepository(persistence: PersistenceService())))
        let vm = MainViewModel(repository: PersistenceRepository(persistence: PersistenceService()))
        let vc = MainViewController(viewModel: vm)
        let navigationController = UINavigationController(rootViewController: vc)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        self.window = window
    }
}

