//
//  MainViewController.swift
//  ToDoListApp
//
//  Created by Alice on 28.07.2023.
//

import UIKit

class MainViewController: UIViewController {
    
    // UI
    
    private let titleUserLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let addButton = UIButton()
    private let stackView = UIStackView()
    private let firstCube = TwoLabelsView()
    private let secondtCube = TwoLabelsView()
    
    // MARK: - Lifecycle
    
    override func loadView() {
        super.loadView()
        addViews()
        configureAppearance()
        configureLayout()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
    
    // MARK: - Private
    
    private func addViews() {
        view.addSubview(titleUserLabel)
        view.addSubview(descriptionLabel)
        view.addSubview(addButton)
        view.addSubview(stackView)
        stackView.addArrangedSubview(firstCube)
        stackView.addArrangedSubview(secondtCube)
    }
    
    private func configureAppearance() {
        titleUserLabel.font = .systemFont(ofSize: 30, weight: .bold)
        titleUserLabel.textColor = .black
        titleUserLabel.text = "Hey!"
        titleUserLabel.translatesAutoresizingMaskIntoConstraints = false
        
        descriptionLabel.font = .systemFont(ofSize: 18, weight: .light)
        descriptionLabel.textColor = .gray
        descriptionLabel.numberOfLines = 0
        descriptionLabel.text = "You have 1 task"
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        addButton.layer.cornerRadius = 15
        addButton.backgroundColor = UIColor(named: "Color")
        addButton.setImage(UIImage(named: "PlusImage"), for: .normal)
        addButton.translatesAutoresizingMaskIntoConstraints = false
        
        firstCube.amoutTasks.text  = "0"
        firstCube.tasks.text = "Task created"
        secondtCube.amoutTasks.text = "0"
        secondtCube.tasks.text = "Task left"
        
        firstCube.translatesAutoresizingMaskIntoConstraints = false
        secondtCube.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillEqually
    }
    
    private func configureLayout() {
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

            stackView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 48),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -48)
        ])
    }
}

