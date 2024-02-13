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
    
    // Dependencies
    var viewModel: MainViewModel
    
    // addViewModel

    private var cells: [TaskModel] = []
    
    // UI
    private let titleUserLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let addTaskButton = UIButton()
    private let informationStackView = UIStackView()
    private let createdTasksView = InformationBlockView()
    private let completedTasksView = InformationBlockView()
    private let tasksListTableView = UITableView(frame: .zero, style: UITableView.Style.grouped)
    
    // Init
    init(viewModel: MainViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
 
    // MARK: - Lifecycle
    
    override func loadView() {
        super.loadView()
        addViews()
        configureAppearance()
        configureLayout()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Private
    
    private func addViews() {
        [titleUserLabel, descriptionLabel, addTaskButton, informationStackView, informationStackView, createdTasksView, tasksListTableView].forEach { subview in
            view.addSubview(subview)
        }
        [createdTasksView, completedTasksView].forEach { subview in
            informationStackView.addArrangedSubview(subview)
        }
    }
    
    private func configureAppearance() {
        view.backgroundColor = .white
        
        self.cells = configureData()
        // Labels
        titleUserLabel.font = Assets.Fonts.titleFont
        titleUserLabel.textColor = .black
        titleUserLabel.text = "Hey!"
        descriptionLabel.font = Assets.Fonts.mediumLightFont
        descriptionLabel.textColor = .gray
        descriptionLabel.numberOfLines = 0
        descriptionLabel.text = "You have 1 task"
        // Button
        addTaskButton.addTarget(self, action: #selector(addTaskTapped), for: .touchUpInside)
        addTaskButton.layer.cornerRadius = .mediumRadius
        addTaskButton.backgroundColor = Assets.Colors.mainPinkColor
        addTaskButton.setImage(Assets.Images.plusImage, for: .normal)
        // Information blocks & stack view
        informationStackView.distribution = .fillEqually
        // Table
        tasksListTableView.register(TaskCell.self, forCellReuseIdentifier: TaskCell.identifier)
        tasksListTableView.rowHeight = UITableView.automaticDimension
        tasksListTableView.estimatedRowHeight = 48
        tasksListTableView.tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: 0.001, height: 0))
        tasksListTableView.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: 0.001, height: 0))
        tasksListTableView.dataSource = self
        tasksListTableView.delegate = self
        tasksListTableView.separatorColor = UIColor.clear
        tasksListTableView.backgroundColor = .clear
        // TODO: - Нужно удалить и заменить на корректные данные
        createdTasksView.configure(with: InformationBlockView.Model(count: 2, description: "Task created"))
        completedTasksView.configure(with: InformationBlockView.Model(count: 3, description: "Task completed"))
    }
    
    private func configureLayout() {
        [titleUserLabel, descriptionLabel, addTaskButton, informationStackView, completedTasksView, createdTasksView, tasksListTableView].forEach {
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
            informationStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constants.specificMargin),
            
            tasksListTableView.topAnchor.constraint(equalTo: informationStackView.bottomAnchor, constant: .smallMargin),
            tasksListTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tasksListTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tasksListTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func configureData() -> [TaskModel] {
        var result: [TaskModel] = []
        
        result.append(TaskModel(name: "go to workjhdjshjfhjsdfhsjdhfjsdfhsdjf dhfjdhfjsdhfjsdf dhfsjdfhsjhsjdhfjsdhfsjfhs", description: "по желанию", executionAt: Date(timeIntervalSinceReferenceDate: -123456789.0), priority: .high))
        result.append(TaskModel(name: "go to", description: "по желаниhsjhfjshfjdhfjdhfdjhfj dhfsdjfhdsjf dfhsjfhsd fsdhfjdshfjsdhfj dhfjdfhsjdfhsjfhsdjfhsdjfhsjfhdsjfhsjdfhsdjfhsdjfhsdjfhsdjfю", executionAt: Date(timeIntervalSinceReferenceDate: -123456789.0), priority: nil))
        result.append(TaskModel(name: "go to", description: "по желаниhsjhfjshfjdhfjdhfdjhfj dhfsdjfhdsjf dfhsjfhsd fsdhfjdshfjsdhfj dhfjdfhsjdfhsjfhsdjfhsdjfhsjfhdsjfhsjdfhsdjfhsdjfhsdjfhsdjfю", executionAt: Date(timeIntervalSinceReferenceDate: -123456789.0), priority: nil))
        result.append(TaskModel(name: "go to", description: "по желаниhsjhfjshfjdhfjdhfdjhfj dhfsdjfhdsjf dfhsjfhsd fsdhfjdshfjsdhfj dhfjdfhsjdfhsjfhsdjfhsdjfhsjfhdsjfhsjdfhsdjfhsdjfhsdjfhsdjfю", executionAt: Date(timeIntervalSinceReferenceDate: -123456789.0), priority: nil))
        result.append(TaskModel(name: "go to", description: "по желаниhsjhfjshfjdhfjdhfdjhfj dhfsdjfhdsjf dfhsjfhsd fsdhfjdshfjsdhfj dhfjdfhsjdfhsjfhsdjfhsdjfhsjfhdsjfhsjdfhsdjfhsdjfhsdjfhsdjfю", executionAt: Date(timeIntervalSinceReferenceDate: -123456789.0), priority: nil))
        
        return result
    }

    
    @objc
    private func addTaskTapped() {
        viewModel.goToAddTask()
    }
}

// MARK: - TableView

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cells.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TaskCell.identifier, for: indexPath) as? TaskCell else {
            return UITableViewCell()
        }
        
        cell.configure(with: cells[indexPath.row])
        
        return cell
    }
}

