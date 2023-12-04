//
//  Repository.swift
//  ToDoListApp
//
//  Created by Alice on 12.11.2023.
//

import Foundation

final class ProcessingRepository {
    
    private let persistence: PersistenceService
    
    init(persistence: PersistenceService) {
        self.persistence = persistence
    }
    
    func addTask(_ task: TaskModel) {
        persistence.addTask(task)
    }

    func fetchAllTasks() -> [TaskModel] {
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
    
    func deleteTask(_ task: TaskModel) {
        persistence.deleteTask(task)
    }
}
