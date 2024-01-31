//
//  MainViewModel.swift
//  ToDoListApp
//
//  Created by Alice on 20.11.2023.
//

import UIKit

protocol IMainViewModel {
    func fetchAllTasksToList() -> [TaskModel]
    func deleteTaskList(_ task: TaskModel)
}

final class MainViewModel: IMainViewModel {
    
    private let repository: PersistenceRepository
    
    init(repository: PersistenceRepository) {
        self.repository = repository
    }

    func fetchAllTasksToList() -> [TaskModel] {
        return repository.fetchAllTasksToList()
    }
    
    func deleteTaskList(_ task: TaskModel) {
        repository.deleteTaskToList(task)
    }
}
