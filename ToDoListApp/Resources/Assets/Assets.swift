//
//  Colors.swift
//  ToDoListApp
//
//  Created by Ilya Gavrilov on 03.08.2023.
//

import UIKit

/// Используется для получения быстрого доступа ко всем ресурсам
public enum Assets {
    /// Все кастомные цвета
    public enum Colors {
        public static let mainPinkColor: UIColor = UIColor(named: "MainPinkColor")!
    }
    
    /// Все кастомные изображения
    public enum Images {
        public static let plusImage: UIImage = UIImage(named: "PlusImage")!
    }
    
    /// Все шрифты
    public enum Fonts {
        public static let smallLightFont: UIFont = .systemFont(ofSize: 14, weight: .light)
        public static let mediumLightFont: UIFont = .systemFont(ofSize: 17, weight: .light)
        
        public static let mediumBoldFont: UIFont = .systemFont(ofSize: 17, weight: .bold)
        public static let titleFont: UIFont = .systemFont(ofSize: 30, weight: .bold)
    }
}
