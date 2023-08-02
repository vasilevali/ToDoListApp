//
//  MainViewController.swift
//  ToDoListApp
//
//  Created by Alice on 28.07.2023.
//

import UIKit

final class MainViewController: UIViewController {
    
    // UI
    private let titleUserLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let addButton = UIButton()
    private let informationStackView = UIStackView()
    private let createdTasks = DescriptionLabel()
    private let completedTasks = DescriptionLabel()
    
    // MARK: - Lifecycle
    
    override func loadView() {
        super.loadView()
        addViews()
        configureAppearance()
        configureLayout()
    }
    
    // MARK: - Private
    
    private func addViews() {
        [titleUserLabel, descriptionLabel, addButton, informationStackView, informationStackView, createdTasks].forEach { view in
            view.addSubview(view)
        }
        [createdTasks, completedTasks].forEach { view in
            informationStackView.addArrangedSubview(view)
        }
    }
    
    private func configureAppearance() {
        view.backgroundColor = .white
        
        titleUserLabel.font = .systemFont(ofSize: 30, weight: .bold)
        titleUserLabel.textColor = .black
        titleUserLabel.text = "Hey!"
        
        descriptionLabel.font = .systemFont(ofSize: 18, weight: .light)
        descriptionLabel.textColor = .gray
        descriptionLabel.numberOfLines = 0
        descriptionLabel.text = "You have 1 task"
        
        addButton.layer.cornerRadius = 15
        addButton.backgroundColor = UIColor(named: "Color")
        addButton.setImage(UIImage(named: "PlusImage"), for: .normal)
        addButton.translatesAutoresizingMaskIntoConstraints = false
        
//        firstCube.amoutTasks.text  = "0"
//        firstCube.tasks.text = "Task created"
//        secondtCube.amoutTasks.text = "0"
//        secondtCube.tasks.text = "Task left"
        
        createdTasks.translatesAutoresizingMaskIntoConstraints = false
        completedTasks.translatesAutoresizingMaskIntoConstraints = false
        informationStackView.translatesAutoresizingMaskIntoConstraints = false
        informationStackView.distribution = .fillEqually
    }
    
    private func configureLayout() {
        titleUserLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleUserLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32),
            titleUserLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            titleUserLabel.trailingAnchor.constraint(equalTo: addButton.leadingAnchor, constant: -8),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleUserLabel.bottomAnchor, constant: 5),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            
            addButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32),
            addButton.centerYAnchor.constraint(equalTo: titleUserLabel.centerYAnchor),
            addButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            addButton.heightAnchor.constraint(equalToConstant: 40),
            addButton.widthAnchor.constraint(equalToConstant: 40),

            informationStackView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16),
            informationStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 48),
            informationStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -48)
        ])
    }
}

