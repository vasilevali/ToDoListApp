//
//  TwoLabelsView.swift
//  ToDoListApp
//
//  Created by Alice on 29.07.2023.
//

import UIKit

// MARK: - InformationBlockView

final class InformationBlockView: UIView {
    
    // UI
    private let countTasksLabel = UILabel()
    private let descriptionTasksLabel = UILabel()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
        configureLayout()
        configureAppearance()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private
    
    private func addViews() {
        [countTasksLabel, descriptionTasksLabel].forEach { view in
            addSubview(view)
        }
    }
    
    private func configureLayout() {
        [countTasksLabel, descriptionTasksLabel].forEach { view in
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            countTasksLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: .tinyMargin),
            countTasksLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: .tinyMargin),
            countTasksLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),

            descriptionTasksLabel.topAnchor.constraint(equalTo: countTasksLabel.bottomAnchor, constant: .tinyMargin),
            descriptionTasksLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: .tinyMargin),
            descriptionTasksLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            descriptionTasksLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    private func configureAppearance() {
        // Labels
        countTasksLabel.numberOfLines = 0
        countTasksLabel.font = Assets.Fonts.mediumBoldFont
        countTasksLabel.textColor = .black
        descriptionTasksLabel.numberOfLines = 0
        descriptionTasksLabel.font = Assets.Fonts.smallLightFont
        descriptionTasksLabel.textColor = .gray
    }
}

// MARK: - Extension InformationBlockView

extension InformationBlockView: Configurable {
    
    struct Model {
        let count: Int
        let description: String
    }
    
    func configure(with model: Model) {
        countTasksLabel.text = "\(model.count)"
        descriptionTasksLabel.text = model.description
    }
}
