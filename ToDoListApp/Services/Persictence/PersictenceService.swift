//
//  PersictenceService.swift
//  ToDoListApp
//
//  Created by Ilya Gavrilov on 05.08.2023.
//

import Foundation
import CoreData

// MARK: - IPersistenceService

protocol IPersistenceService {
    func addTask(_ task: TaskModel)
    func deleteTask(_ task: TaskModel)
    func updateTask(_ newTask: TaskModel)
    func fetchAllTasks(complition: @escaping (Result<[TaskModel], Error>) -> Void)
    func fetchTodayTasks() -> [TaskModel]
}

// MARK: - PersistenceService

final class PersistenceService: IPersistenceService {
    
    private lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "ToDoListApp")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    private var viewContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    private func saveContext() {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func addTask(_ task: TaskModel) {
        let newTask = Task(context: viewContext)
        newTask.name = task.name
        newTask.descriptionTask = newTask.descriptionTask
        newTask.priority = task.priority == nil ? 100 : Int16(task.priority!.rawValue)
        
        saveContext()
    }
    
    func deleteTask(_ task: TaskModel) {
        let deleteTask = Task(context: viewContext)
        deleteTask.name = task.name
        deleteTask.descriptionTask = task.description
        deleteTask.priority = task.priority == nil ? 100 : Int16(task.priority!.rawValue)
        
        viewContext.delete(deleteTask)
        saveContext()
    }
    
    func updateTask(_ newTask: TaskModel) {
        
    }
    
    func fetchAllTasks(complition: @escaping (Result<[TaskModel], Error>) -> Void) {
        let request: NSFetchRequest<Task> = Task.fetchRequest()
        
        do {
            let tasks = try viewContext.fetch(request)
            let currentTasks = tasks.map {
                TaskModel(name: $0.name ?? "", description: $0.descriptionTask, priority: TaskPriority(rawValue: Int($0.priority)))
            }
            complition(.success(currentTasks))
        } catch {
            complition(.failure(PercictenceState.fetchedResultError))
        }
    }
    
    func fetchTodayTasks() -> [TaskModel] {
        []
    }
}
