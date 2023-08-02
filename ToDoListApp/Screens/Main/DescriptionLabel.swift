//
//  TwoLabelsView.swift
//  ToDoListApp
//
//  Created by Alice on 29.07.2023.
//

import Foundation
import UIKit

final class DescriptionLabel: UIView {
    
    private let countTasks = UILabel()
    private let descriptionTasks = UILabel()
    
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
        [countTasks, descriptionTasks].forEach { view in
            addSubview(view)
        }
    }
    
    private func configureLayout() {
        [countTasks, descriptionTasks].forEach { view in
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            countTasks.topAnchor.constraint(equalTo: self.topAnchor, constant: 4),
            countTasks.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 4),
            countTasks.trailingAnchor.constraint(equalTo: self.trailingAnchor),

            descriptionTasks.topAnchor.constraint(equalTo: countTasks.bottomAnchor, constant: 4),
            descriptionTasks.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 4),
            descriptionTasks.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            descriptionTasks.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    private func configureAppearance() {
        countTasks.numberOfLines = 0
        countTasks.font = .systemFont(ofSize: 18, weight: .bold)
        countTasks.textColor = .black
        descriptionTasks.numberOfLines = 0
        descriptionTasks.font = .systemFont(ofSize: 15, weight: .light)
        descriptionTasks.textColor = .gray
    }
}
