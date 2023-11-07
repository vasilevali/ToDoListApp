//
//  TableViewCell.swift
//  ToDoListApp
//
//  Created by Alice on 23.08.2023.
//

import UIKit

// MARK: - Constants

private enum Constants {
    static let sizePriority: CGFloat = 12
}

// MARK: - TaskCell

final class TaskCell: UITableViewCell {
    
    // Public property
    static var identifier: String {
        String(describing: self)
    }
    
    // UI
    private let dateLabel = UILabel()
    private let taskLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let containerView = UIView()
    private let taskPriorityView = UIView()
    
    // MARK: - Init
    
    override init(style: TaskCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addCell()
        configureLayout()
        configureAppearance()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private
    
    private func addCell() {
        self.addSubview(containerView)
        
        [dateLabel, taskLabel, descriptionLabel, taskPriorityView].forEach { subview in
            containerView.addSubview(subview)
        }
    }
    
    private func configureAppearance() {
        // Task
        taskLabel.numberOfLines = 0
        taskLabel.font = Assets.Fonts.mediumBoldFont
        taskLabel.textColor = .black
        // Date
        dateLabel.font = Assets.Fonts.mediumLightFont
        dateLabel.textColor = .black
        // Description
        descriptionLabel.font = Assets.Fonts.smallLightFont
        descriptionLabel.textColor = .darkGray
        descriptionLabel.numberOfLines = 0
        // Container
        containerView.layer.cornerRadius = .baseRadius
        containerView.layer.borderColor = UIColor.lightGray.cgColor
        containerView.layer.borderWidth = 1
        containerView.clipsToBounds = true
        // ViewPriority
        taskPriorityView.backgroundColor = .blue
        taskPriorityView.layer.cornerRadius = Constants.sizePriority / 2
    }
    
    private func configureLayout() {
        [dateLabel, taskLabel, descriptionLabel, containerView, taskPriorityView].forEach {
            $0?.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: self.topAnchor, constant: .tinyMargin),
            containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: .tinyMargin),
            containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -.tinyMargin),
            containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
            
            taskLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: .tinyMargin),
            taskLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: .smallMargin),
            taskLabel.trailingAnchor.constraint(equalTo: taskPriorityView.trailingAnchor, constant: -.compactMargin),
            
            descriptionLabel.topAnchor.constraint(equalTo: taskLabel.bottomAnchor, constant: .tinyMargin),
            descriptionLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: .smallMargin),
            descriptionLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -.smallMargin),
            
            dateLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: .tinyMargin),
            dateLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: .smallMargin),
            dateLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -.smallMargin),
            dateLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -.smallMargin),
            
            taskPriorityView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: .compactMargin),
            taskPriorityView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -.compactMargin),
            taskPriorityView.heightAnchor.constraint(equalToConstant: Constants.sizePriority),
            taskPriorityView.widthAnchor.constraint(equalToConstant: Constants.sizePriority)
        ])
    }
}

// MARK: - Extension TableViewCell

extension TaskCell: Configurable {
    typealias Model = TaskModel
    
    func configure(with model: TaskModel) {
        taskLabel.text = model.name
        descriptionLabel.text = model.description
        dateLabel.text = "\(String(describing: model.executionAt))"
    }
}


