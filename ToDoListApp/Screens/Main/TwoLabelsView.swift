//
//  TwoLabelsView.swift
//  ToDoListApp
//
//  Created by мак on 29.07.2023.
//

import Foundation
import UIKit

class TwoLabelsView: UIView {
    
    let amoutTasks = UILabel()
    let tasks = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
        configureLayout()
        configureAppearance()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addViews() {
        [amoutTasks, tasks].forEach { view in
            addSubview(view)
        }
    }
    
    private func configureLayout() {
        [amoutTasks, tasks].forEach { view in
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            amoutTasks.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            amoutTasks.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
            amoutTasks.trailingAnchor.constraint(equalTo: self.trailingAnchor),

            tasks.topAnchor.constraint(equalTo: amoutTasks.bottomAnchor, constant: 5),
            tasks.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
            tasks.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            tasks.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    private func configureAppearance() {
        amoutTasks.numberOfLines = 0
        amoutTasks.font = .systemFont(ofSize: 18, weight: .bold)
        amoutTasks.textColor = .black
        tasks.numberOfLines = 0
        tasks.font = .systemFont(ofSize: 15, weight: .light)
        tasks.textColor = .gray
    }
}
