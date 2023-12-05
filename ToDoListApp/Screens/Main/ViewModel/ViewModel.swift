//
//  File.swift
//  ToDoListApp
//
//  Created by мак on 20.11.2023.
//

import UIKit

protocol MainViewModelProtocol {
    func addTaskToList(_ task: TaskModel)
    func fetchAllTasksToList() -> [TaskModel]
    func deleteTaskList(_ task: TaskModel)
}

final class MainViewModel: MainViewModelProtocol {
    
    private let repository: ProcessingRepository
    
    init(repository: ProcessingRepository) {
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
