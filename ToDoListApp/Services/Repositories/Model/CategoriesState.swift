//
//  CategoriesState.swift
//  ToDoListApp
//
//  Created by мак on 14.11.2023.
//

import Foundation

enum CategoriesState {
    case loading
    case success([TaskModel])
    case failed
}
