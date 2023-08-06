//
//  AddedTaskViewController.swift
//  ToDoListApp
//
//  Created by Alice on 05.08.2023.
//

import UIKit

// MARK: - Constants
private enum Constants {
    static let buttonWidth: CGFloat = 100
    static let buttoHeight: CGFloat = 40
}

// MARK: - AddedTaskViewController

final class AddedTaskViewController: UIViewController {
 
    //UI
    private let addTaskTextField = UITextField()
    private let choorseDateLabel = UILabel()
    private let timeExecutionDatePicker = UIDatePicker()
    private let addButton = UIButton()
    
    // MARK: - Lifecycle
    
    override func loadView() {
        super.loadView()
        addViews()
        configureAppearance()
        configureLayout()
    }
    
    // MARK: - Private
    
    private func addViews() {
        [addTaskTextField, timeExecutionDatePicker, addButton, choorseDateLabel].forEach { subview in
            view.addSubview(subview)
        }
    }
    
    private func configureAppearance() {
        view.backgroundColor = .white
        
        addTaskTextField.placeholder = "Add a task"
        addTaskTextField.borderStyle = .roundedRect
        addTaskTextField.layer.cornerRadius = .tinyRadius
        addTaskTextField.clearButtonMode = .always
        
        choorseDateLabel.text = "Choose date"
        choorseDateLabel.textColor = .gray
        
        timeExecutionDatePicker.preferredDatePickerStyle = .wheels
        
        
        addButton.backgroundColor = .lightGray
        addButton.layer.cornerRadius = .tinyRadius
        addButton.setTitle("Add task!", for: .normal)
    }
    
    private func configureLayout() {
        [addTaskTextField, timeExecutionDatePicker, addButton, choorseDateLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        NSLayoutConstraint.activate([
            addTaskTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: .extraLargeMargin),
            addTaskTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: .baseMargin),
            addTaskTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -.smallMargin),
            
            choorseDateLabel.topAnchor.constraint(equalTo: addTaskTextField.bottomAnchor, constant: .baseMargin),
            choorseDateLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: .largeMargin),
            choorseDateLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -.largeMargin),
            
            timeExecutionDatePicker.topAnchor.constraint(equalTo: choorseDateLabel.bottomAnchor, constant: .tinyMargin),
            timeExecutionDatePicker.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: .extraLargeMargin),
            timeExecutionDatePicker.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -.extraLargeMargin),
            
            addButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -.extraLargeMargin),
            addButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: .extraLargeMargin),
            addButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -.extraLargeMargin),
//            addButton.widthAnchor.constraint(equalToConstant: Constants.buttonWidth),
//            addButton.heightAnchor.constraint(equalToConstant: Constants.buttoHeight)
            
        ])
    }
}
