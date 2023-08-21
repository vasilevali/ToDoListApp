//
//  MainViewController.swift
//  ToDoListApp
//
//  Created by Alice on 28.07.2023.
//

import UIKit

// MARK: - Constants

private enum Constants {
    static let buttonSize: CGFloat = 40
    static let specificMargin: CGFloat = 48
}

// MARK: - MainViewController

final class MainViewController: UIViewController {
    
    // UI
    private let titleUserLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let addTaskButton = UIButton()
    private let informationStackView = UIStackView()
    private let createdTasksView = InformationBlockView()
    private let completedTasksView = InformationBlockView()
    
    // MARK: - Lifecycle
    
    override func loadView() {
        super.loadView()
        addViews()
        configureAppearance()
        configureLayout()
    }
    
    // MARK: - Private
    
    private func addViews() {
        [titleUserLabel, descriptionLabel, addTaskButton, informationStackView, informationStackView, createdTasksView].forEach { subview in
            view.addSubview(subview)
        }
        [createdTasksView, completedTasksView].forEach { subview in
            informationStackView.addArrangedSubview(subview)
        }
    }
    
    private func configureAppearance() {
        view.backgroundColor = .white
        
        // Labels
        titleUserLabel.font = Assets.Fonts.titleFont
        titleUserLabel.textColor = .black
        titleUserLabel.text = "Hey!"
        descriptionLabel.font = Assets.Fonts.mediumLightFont
        descriptionLabel.textColor = .gray
        descriptionLabel.numberOfLines = 0
        descriptionLabel.text = "You have 1 task"
        // Button
        addTaskButton.addTarget(self, action: #selector(addClick), for: .touchUpInside)
        addTaskButton.layer.cornerRadius = .mediumRadius
        addTaskButton.backgroundColor = Assets.Colors.mainPinkColor
        addTaskButton.setImage(Assets.Images.plusImage, for: .normal)
        // Information blocks & stack view
        informationStackView.distribution = .fillEqually
        // TODO: - Нужно удалить и заменить на корректные данные
        createdTasksView.configure(with: InformationBlockView.Model(count: 2, description: "Task created"))
        completedTasksView.configure(with: InformationBlockView.Model(count: 3, description: "Task completed"))
    }
    
    private func configureLayout() {
        [titleUserLabel, descriptionLabel, addTaskButton, informationStackView, completedTasksView, createdTasksView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            titleUserLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: .extraLargeMargin),
            titleUserLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: .baseMargin),
            titleUserLabel.trailingAnchor.constraint(equalTo: addTaskButton.leadingAnchor, constant: -.smallMargin),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleUserLabel.bottomAnchor, constant: .tinyMargin),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: .baseMargin),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -.smallMargin),
            
            addTaskButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: .extraLargeMargin),
            addTaskButton.centerYAnchor.constraint(equalTo: titleUserLabel.centerYAnchor),
            addTaskButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -.extraLargeMargin),
            addTaskButton.heightAnchor.constraint(equalToConstant: Constants.buttonSize),
            addTaskButton.widthAnchor.constraint(equalToConstant: Constants.buttonSize),

            informationStackView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: .baseMargin),
            informationStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.specificMargin),
            informationStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constants.specificMargin)
        ])
    }
    
    @objc
    private func addClick() {
        let mainViewController = AddTaskViewController()
        navigationController?.navigationBar.isHidden = false
        navigationController?.pushViewController(mainViewController, animated: true)
    }
}


