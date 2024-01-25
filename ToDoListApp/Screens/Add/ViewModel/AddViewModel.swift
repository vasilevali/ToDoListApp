//
//  AddViewModel.swift
//  ToDoListApp
//
//  Created by Alice on 31.12.2023.
//

import Foundation

protocol IAddViewModel {
    func addTaskToList(_ task: TaskModel)
    func fetchAllTasksToList() -> [TaskModel]?
}

final class AddViewModel: IAddViewModel {
    
    private let repository: PersistenceRepository
    
    init(repository: PersistenceRepository) {
        self.repository = repository
    }
    
    func addTaskToList(_ task: TaskModel) {
        repository.addTaskToList(task)
    }
    
    func fetchAllTasksToList() -> [TaskModel]? {
        
        let fetchAllTasksToList = [TaskModel]()
        if fetchAllTasksToList.isEmpty { return nil }
        
        return repository.fetchAllTasksToList()
    }
}

