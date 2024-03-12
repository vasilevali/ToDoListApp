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
    private let addTaskTextView = UITextView()
    private let descriptionLabel = UILabel()
    private let descriptionTextView = UITextView()
    private let addTaskButton = UIButton()
    private let line = UIView()
    
    // MARK: - Lifecycle
    
    override func loadView() {
        super.loadView()
        addViews()
        configureAppearance()
        configureLayout()
    }
    
    // MARK: - Private
    
    private func addViews() {
        [addTaskTextView, addTaskButton, descriptionLabel, descriptionTextView, line].forEach { subview in
            view.addSubview(subview)
        }
    }
    
    private func configureAppearance() {
        view.backgroundColor = .white
        
        addTaskButton.addTarget(self, action: #selector(addTaskTapped), for: .touchUpInside)
    
        addTaskTextView.layer.borderColor = UIColor.lightGray.cgColor
        addTaskTextView.layer.borderWidth = 1
        addTaskTextView.layer.cornerRadius = .mediumRadius
        addTaskTextView.font = Assets.Fonts.mediumBoldFont
        
        descriptionLabel.text = "Write description"
        descriptionLabel.textColor = .gray
        
        addTaskButton.backgroundColor = .lightGray
        addTaskButton.layer.cornerRadius = .tinyRadius
        addTaskButton.setTitle("Add task!", for: .normal)
        
        line.backgroundColor = .lightGray
        
        let buttonDelete = UIBarButtonItem(title: "Delete", style: UIBarButtonItem.Style.done, target: self, action: #selector(deleteTaskTapped))
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationController?.navigationItem.setRightBarButton(buttonDelete, animated: true)
    }
    
    private func configureLayout() {
        [addTaskTextView, addTaskButton, descriptionLabel, descriptionTextView, line].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        NSLayoutConstraint.activate([
            addTaskTextView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: .extraLargeMargin),
            addTaskTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: .baseMargin),
            addTaskTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -.smallMargin),
            addTaskTextView.heightAnchor.constraint(equalToConstant: 56),
            
            descriptionLabel.topAnchor.constraint(equalToSystemSpacingBelow: addTaskTextView.bottomAnchor, multiplier: .smallMargin),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: .largeMargin),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: .largeMargin),
            
            line.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: .tinySpace),
            line.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: .baseMargin),
            line.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -.smallMargin),
            line.heightAnchor.constraint(equalToConstant: 1),
            
            descriptionTextView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: .smallMargin),
            descriptionTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: .largeMargin),
            descriptionTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -.largeMargin),
            descriptionTextView.bottomAnchor.constraint(equalTo: addTaskButton.topAnchor, constant: -8),
            
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
        descriptionTextView.text = model.description
        addTaskTextView.text = model.name
    }
}
