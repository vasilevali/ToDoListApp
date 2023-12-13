//
//  MainViewModel.swift
//  ToDoListApp
//
//  Created by Alice on 20.11.2023.
//

import UIKit

protocol IMainViewModel {
    func addTaskToList(_ task: TaskModel)
    func fetchAllTasksToList() -> [TaskModel]
    func deleteTaskList(_ task: TaskModel)
}

final class MainViewModel: IMainViewModel {
    
    private let repository: PersistenceRepository
    
    init(repository: PersistenceRepository) {
        self.repository = repository
    }
    
    func addTaskToList(_ task: TaskModel) {
        repository.addTask(task)
    }
    
    func fetchAllTasksToList() -> [TaskModel] {
        return repository.fetchAllTasks()
    }
    
    func deleteTaskList(_ task: TaskModel) {
        repository.deleteTask(task)
    }
}
