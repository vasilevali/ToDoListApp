//
//  Repository.swift
//  ToDoListApp
//
//  Created by Alice on 12.11.2023.
//

import Foundation
import UserNotifications

// MARK: - INotificationRepository

protocol INotificationRepository {
    func requestAuth()
}

// MARK: - NotificationRepository

final class NotificationRepository: INotificationRepository {
    
    // Dependencies
    private let service: INotificationService
    
    // MARK: - Init
    
    init(service: INotificationService) {
        self.service = service
    }
    
    func requestAuth() {
        service.requestAuth()
    }
}

