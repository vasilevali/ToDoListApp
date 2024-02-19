//
//  AddedTaskViewController.swift
//  ToDoListApp
//
//  Created by Alice on 05.08.2023.
//

import UIKit

// MARK: - AddTaskViewController

final class AddTaskViewController: UIViewController {

    
    // UI
    private let addTaskTextField = UITextField()
    private let chooseDateLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let descriptionTextField = UITextField()
    private let addTaskButton = UIButton()
    
    // MARK: - Lifecycle
    
    override func loadView() {
        super.loadView()
        addViews()
        configureAppearance()
        configureLayout()
    }
    
    // MARK: - Private
    
    private func addViews() {
        [addTaskTextField, addTaskButton, chooseDateLabel, descriptionLabel, descriptionTextField].forEach { subview in
            view.addSubview(subview)
        }
    }
    
    private func configureAppearance() {
        view.backgroundColor = .white
        
        addTaskButton.addTarget(self, action: #selector(addTaskTapped), for: .touchUpInside)
        
        addTaskTextField.placeholder = "Add a task"
        addTaskTextField.font = Assets.Fonts.titleFont
        
        chooseDateLabel.text = "Choose date"
        chooseDateLabel.textColor = .gray
        
        descriptionLabel.text = "Write description"
        descriptionLabel.textColor = .gray
        
        descriptionTextField.placeholder = "Add description"
        descriptionTextField.clearButtonMode = .always
        descriptionTextField.font = Assets.Fonts.mediumBoldFont
        
        addTaskButton.backgroundColor = .lightGray
        addTaskButton.layer.cornerRadius = .tinyRadius
        addTaskButton.setTitle("Add task!", for: .normal)
        
        let buttonDelete = UIBarButtonItem(title: "Delete", style: UIBarButtonItem.Style.done, target: self, action: #selector(deleteTaskTapped))
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationController?.navigationItem.setRightBarButton(buttonDelete, animated: true)
    }
    
    private func configureLayout() {
        [addTaskTextField, addTaskButton, chooseDateLabel, descriptionLabel, descriptionTextField].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        NSLayoutConstraint.activate([
            addTaskTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: .extraLargeMargin),
            addTaskTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: .baseMargin),
            addTaskTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -.smallMargin),
            
            chooseDateLabel.topAnchor.constraint(equalTo: addTaskTextField.bottomAnchor, constant: .baseMargin),
            chooseDateLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: .largeMargin),
            chooseDateLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -.largeMargin),
            
            descriptionLabel.topAnchor.constraint(equalToSystemSpacingBelow: chooseDateLabel.bottomAnchor, multiplier: .smallMargin),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: .largeMargin),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: .largeMargin),
            
            descriptionTextField.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: .smallMargin),
            descriptionTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: .largeMargin),
            descriptionTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -.largeMargin),
            
            addTaskButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -.extraLargeMargin),
            addTaskButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: .extraLargeMargin),
            addTaskButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -.extraLargeMargin)
        ])
    }
    
    @objc
    private func addTaskTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc
    func deleteTaskTapped() {
        navigationController?.popViewController(animated: true)
    }
}

// MARK: - Configurable

extension AddTaskViewController: Configurable {
    
    typealias Model = TaskModel
    
    func configure(with model: TaskModel) {
        descriptionTextField.text = model.description
        addTaskTextField.text = model.name
    }
}
