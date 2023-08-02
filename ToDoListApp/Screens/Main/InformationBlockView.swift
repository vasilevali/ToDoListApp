//
//  TwoLabelsView.swift
//  ToDoListApp
//
//  Created by Alice on 29.07.2023.
//

import Foundation
import UIKit

final class InformationBlockView: UIView {
    
    private let countTasksLabel = UILabel()
    private let descriptionTasksLabel = UILabel()
    
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
        [countTasksLabel, descriptionTasksLabel].forEach { view in
            addSubview(view)
        }
    }
    
    private func configureLayout() {
        [countTasksLabel, descriptionTasksLabel].forEach { view in
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            countTasksLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 4),
            countTasksLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 4),
            countTasksLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),

            descriptionTasksLabel.topAnchor.constraint(equalTo: countTasksLabel.bottomAnchor, constant: 4),
            descriptionTasksLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 4),
            descriptionTasksLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            descriptionTasksLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    private func configureAppearance() {
        countTasksLabel.numberOfLines = 0
        countTasksLabel.font = .systemFont(ofSize: 18, weight: .bold)
        countTasksLabel.textColor = .black
        descriptionTasksLabel.numberOfLines = 0
        descriptionTasksLabel.font = .systemFont(ofSize: 15, weight: .light)
        descriptionTasksLabel.textColor = .gray
    }
}
