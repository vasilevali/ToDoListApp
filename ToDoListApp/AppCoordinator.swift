//
//  Coordinator.swift
//  ToDoListApp
//
//  Created by Alice on 31.12.2023.
//

import UIKit

protocol MainNaigator: AnyObject {
    func addTask()
}

// MARK: - AppCoordinater

class AppCoordinator: Coordinator {
    
    // Dependencies
    var navigationController: UINavigationController
    var persistenceRepository: IPersistenceRepository
    
    
    // MARK: - Init
    
    init(navigationController: UINavigationController, persistenceRepository: IPersistenceRepository) {
        self.navigationController = navigationController
        self.persistenceRepository = persistenceRepository
    }
    
    // MARK: - Coordinater
    
    func start() {
        let mvm = MainViewModel(navigation: self, repository: PersistenceRepository(persistence: PersistenceService()))
        let mvc = MainViewController(viewModel: mvm)
        navigationController.setViewControllers([mvc], animated: false)
        navigationController.setNavigationBarHidden(true, animated: true)
    }
}

// MARK: - MainNaigator

extension AppCoordinator: MainNaigator {
 
    func addTask() {
    }
}
