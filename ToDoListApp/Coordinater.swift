//
//  Coordinator.swift
//  ToDoListApp
//
//  Created by Alice on 31.12.2023.
//

import UIKit

//protocol IMainNaigator: AnyObject {
//    func addTask()
//    func addDescription()
//    func addDate()
//}

// MARK: - AppCoordinater

class AppCoordinater: Coordinater {
    
    var navigationController: UINavigationController
    
    // MARK: - Init
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // MARK: - Coordinater
    
    func start() {
        let mvm = MainViewModel(repository: PersistenceRepository(persistence: PersistenceService()))
        let mvc = MainViewController(viewModel: mvm)
        navigationController.setViewControllers([mvc], animated: false)
    }
    
    
}
