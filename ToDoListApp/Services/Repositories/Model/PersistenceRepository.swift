//
//  PersistenceRepository.swift
//  ToDoListApp
//
//  Created by Alice on 12.11.2023.
//

import Foundation

protocol IPersistenceRepository {
    func addTaskToList(_ task: TaskModel)
    func fetchAllTasksToList() -> [TaskModel]
    func deleteTaskFromList(_ task: TaskModel)
}

final class PersistenceRepository: IPersistenceRepository {
    
    
    private let persistence: PersistenceService
    
    init(persistence: PersistenceService) {
        self.persistence = persistence
    }
    
    func deleteTaskFromList(_ task: TaskModel) {
        persistence.deleteTask(task)
    }
    
    func addTaskToList(_ task: TaskModel) {
        persistence.addTask(task)
    }
    
    func fetchAllTasksToList() -> [TaskModel] {
        var currentTasks: [TaskModel] = []
        persistence.fetchAllTasks { result in
            switch result {
            case .success(let tasks):
                currentTasks = tasks
            case .failure(_): break
            }
        }
        return currentTasks
    }
}
