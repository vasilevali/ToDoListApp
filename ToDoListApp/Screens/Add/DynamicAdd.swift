//
//  DynamicAdd.swift
//  ToDoListApp
//
//  Created by мак on 11.11.2023.
//

import Foundation

class DynamicAdd<T> {
    typealias Listener = (T) -> Void
    private var listener: Listener?
    
    func bind(_ listener: Listener?) {
        self.listener = listener
    }
    
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    init(_ v: T) {
        value = v
    }
}
