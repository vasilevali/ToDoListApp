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
    
    private let navigation: MainNavigator
    private let repository: PersistenceRepository
    
    init(navigation: MainNavigator, repository: PersistenceRepository) {
        self.repository = repository
        self.navigation = navigation
    }
    
    func fetchAllTasksToList() -> [TaskModel] {
        var result: [TaskModel] = []
        
        result.append(TaskModel(name: "go to workjhdjshjfhjsdfhsjdhfjsdfhsdjf dhfjdhfjsdhfjsdf dhfsjdfhsjhsjdhfjsdhfsjfhs", description: "по желанию", priority: .high))
        result.append(TaskModel(name: "go to", description: "по желаниhsjhfjshfjdhfjdhfdjhfj dhfsdjfhdsjf dfhsjfhsd fsdhfjdshfjsdhfj dhfjdfhsjdfhsjfhsdjfhsdjfhsjfhdsjfhsjdfhsdjfhsdjfhsdjfhsdjfю", priority: nil))
        result.append(TaskModel(name: "go to", description: "по желаниhsjhfjshfjdhfjdhfdjhfj dhfsdjfhdsjf dfhsjfhsd fsdhfjdshfjsdhfj dhfjdfhsjdfhsjfhsdjfhsdjfhsjfhdsjfhsjdfhsdjfhsdjfhsdjfhsdjfю", priority: nil))
        result.append(TaskModel(name: "go to", description: "по желаниhsjhfjshfjdhfjdhfdjhfj dhfsdjfhdsjf dfhsjfhsd fsdhfjdshfjsdhfj dhfjdfhsjdfhsjfhsdjfhsdjfhsjfhdsjfhsjdfhsdjfhsdjfhsdjfhsdjfю", priority: nil))
        result.append(TaskModel(name: "go to", description: "по желаниhsjhfjshfjdhfjdhfdjhfj dhfsdjfhdsjf dfhsjfhsd fsdhfjdshfjsdhfj dhfjdfhsjdfhsjfhsdjfhsdjfhsjfhdsjfhsjdfhsdjfhsdjfhsdjfhsdjfю", priority: nil))
        
        return result
    }
    
    func deleteTaskList(_ task: TaskModel) {
        repository.deleteTaskFromList(task)
    }
    
    func goToAddTask(_ index: Int? = nil) {
        if let index = index {
            navigation.addTask(fetchAllTasksToList()[index])
        }
    }
}
