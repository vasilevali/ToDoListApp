//
//  Coordinator.swift
//  ToDoListApp
//
//  Created by Alice on 31.12.2023.
//

import UIKit

protocol MainNaigator: AnyObject {
    func addTask(with model: AddTaskViewController.Model)
}

// MARK: - AppCoordinater

class AppCoordinator: Coordinator {
    
    // Dependencies
    var navigationController: UINavigationController
    var addTaskViewontroller: AddTaskViewController
    var persistenceRepository: IPersistenceRepository
    
    
    // MARK: - Init
    
    init(navigationController: UINavigationController, addTaskViewontroller: AddTaskViewController, persistenceRepository: IPersistenceRepository) {
        self.navigationController = navigationController
        self.addTaskViewontroller = addTaskViewontroller
        self.persistenceRepository = persistenceRepository
    }
    
    // MARK: - Coordinater
    
    func start() {
        let mvm = MainViewModel(repository: PersistenceRepository(persistence: PersistenceService()))
        let mvc = MainViewController(viewModel: mvm)
        navigationController.setViewControllers([mvc], animated: false)
    }
}

// MARK: - MainNaigator

extension AppCoordinator: MainNaigator {
 
    func addTask(with model: AddTaskViewController.Model) {
        let avc = AddTaskViewController()
        let mvc = MainViewController(viewModel: MainViewModel(repository: PersistenceRepository(persistence: PersistenceService())))
        avc.configure(with: model)
        navigationController.present(mvc, animated: true)
    }
}
