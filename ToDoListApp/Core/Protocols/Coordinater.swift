//
//  Coordinator.swift
//  ToDoListApp
//
//  Created by мак on 31.12.2023.
//


import UIKit

public protocol Coordinater {
    
    var navigationController: UINavigationController { get set }
    
    func start()
}
