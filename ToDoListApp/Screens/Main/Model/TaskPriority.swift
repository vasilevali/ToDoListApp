//
//  TaskPriority.swift
//  ToDoListApp
//
//  Created by Ilya Gavrilov on 05.08.2023.
//

import Foundation

enum TaskPriority {
    case low
    case medium
    case high
}

extension TaskPriority: RawRepresentable, CaseIterable {
    
    init?(rawValue: Int) {
        switch rawValue {
        case 0: self = .low
        case 1: self = .medium
        case 2: self = .high
        default: return nil
        }
    }
    
    var rawValue: Int {
        switch self {
        case .low: return 0
        case .medium: return 1
        case .high: return 2
        }
    }
}
