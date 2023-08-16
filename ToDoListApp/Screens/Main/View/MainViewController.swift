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
    private let addButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(onClick), for: .touchUpInside)
        
        return button
    }()
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
        [titleUserLabel, descriptionLabel, addButton, informationStackView, informationStackView, createdTasksView].forEach { subview in
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
        addButton.layer.cornerRadius = .mediumRadius
        addButton.backgroundColor = Assets.Colors.mainPinkColor
        addButton.setImage(Assets.Images.plusImage, for: .normal)
        // Information blocks & stack view
        informationStackView.distribution = .fillEqually
        // TODO: - Нужно удалить и заменить на корректные данные
        createdTasksView.configure(with: InformationBlockView.Model(count: 2, description: "Task created"))
        completedTasksView.configure(with: InformationBlockView.Model(count: 3, description: "Task completed"))
    }
    
    private func configureLayout() {
        [titleUserLabel, descriptionLabel, addButton, informationStackView, completedTasksView, createdTasksView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            titleUserLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: .extraLargeMargin),
            titleUserLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: .baseMargin),
            titleUserLabel.trailingAnchor.constraint(equalTo: addButton.leadingAnchor, constant: -.smallMargin),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleUserLabel.bottomAnchor, constant: .tinyMargin),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: .baseMargin),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -.smallMargin),
            
            addButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: .extraLargeMargin),
            addButton.centerYAnchor.constraint(equalTo: titleUserLabel.centerYAnchor),
            addButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -.extraLargeMargin),
            addButton.heightAnchor.constraint(equalToConstant: Constants.buttonSize),
            addButton.widthAnchor.constraint(equalToConstant: Constants.buttonSize),

            informationStackView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: .baseMargin),
            informationStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.specificMargin),
            informationStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constants.specificMargin)
        ])
    }
    
    @objc
    private func onClick() {
        let mainViewController = AddTaskViewController()
        navigationController?.navigationBar.isHidden = false
        navigationController?.pushViewController(mainViewController, animated: true)
    }
//    func showDetailViewController(_ vc: AddTaskViewController, sender: Any?) {
//        let addTaskVC = AddTaskViewController()
//        navigationController?.navigationBar.isHidden = false
//        navigationController?.pushViewController(addTaskVC, animated: true)
//    }
}


