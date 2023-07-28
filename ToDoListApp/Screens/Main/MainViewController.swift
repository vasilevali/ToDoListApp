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
    
    
    // MARK: - Private
    
    private func addViews() {
        view.addSubview(titleUserLabel)
        view.addSubview(descriptionLabel)
        view.addSubview(addButton)
    }
    
    private func configureAppearance() {
        titleUserLabel.font = .systemFont(ofSize: 30, weight: .bold)
        titleUserLabel.textColor = .black
        titleUserLabel.text = "Hey!"
        titleUserLabel.translatesAutoresizingMaskIntoConstraints = false
        
        descriptionLabel.font = .systemFont(ofSize: 20, weight: .light)
        descriptionLabel.textColor = .gray
        descriptionLabel.text = "You have 1 task"
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        addButton.layer.cornerRadius = 15
        addButton.backgroundColor = UIColor(named: "Color")
        addButton.setImage(UIImage(named: "PlusImage"), for: .normal)
        addButton.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func configureLayout() {
        
        NSLayoutConstraint.activate([
        titleUserLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 70),
        titleUserLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 48),
        titleUserLabel.trailingAnchor.constraint(equalTo: addButton.trailingAnchor),
        
        descriptionLabel.topAnchor.constraint(equalTo: titleUserLabel.topAnchor, constant: 40),
        descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 48),
        descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        
        addButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
        addButton.leadingAnchor.constraint(equalTo: titleUserLabel.leadingAnchor, constant: 240),
        addButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -48),
        addButton.heightAnchor.constraint(equalToConstant: 40),
        addButton.widthAnchor.constraint(equalToConstant: 40)
        ])
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addViews()
        configureAppearance()
        configureLayout()
    }
}

