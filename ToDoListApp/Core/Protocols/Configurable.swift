//
//  Configurable.swift
//  ToDoListApp
//
//  Created by Ilya Gavrilov on 03.08.2023.
//

import Foundation

public protocol Configurable: AnyObject {
    
    associatedtype Model
    
    func configure(with model: Model)
}
