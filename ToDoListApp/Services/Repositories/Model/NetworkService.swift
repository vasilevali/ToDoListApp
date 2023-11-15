//
//  NetworkService.swift
//  ToDoListApp
//
//  Created by Alice on 14.11.2023.
//

import Foundation
import UserNotifications

// MARK: - INotificationRepository

protocol INotificationService {
    func requestAuth()
}

// MARK: - NotificationService

final class NotificationService: INotificationService {
    
    // Dependencies
    private let service: UNUserNotificationCenter
    
    // MARK: - Init
    
    init(notificationCenter: UNUserNotificationCenter = UNUserNotificationCenter.current()) {
        self.service = notificationCenter
    }
    
    func requestAuth() {
        service.requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            guard granted else { return }
        }
    }
}
