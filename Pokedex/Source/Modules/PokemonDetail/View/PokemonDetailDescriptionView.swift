//
//  PokemonDetailDescriptionView.swift
//  Pokedex
//
//  Created by Matheus Cunha on 05/08/22.
//  Copyright © 2022 Matheus Cunha. All rights reserved.
//

import UIKit

final class PokemonDetailDescriptionView: UIView {

    private let title: String
    private let value: String?

    init(title: String, value: String? = nil) {
        self.title = title
        self.value = value
        super.init(frame: .zero)
        buildView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Constants.fontName, size: 16)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.text = "\(title): "
        return label
    }()
    
    private lazy var valueLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Constants.fontName, size: 16)
        label.textColor = .darkGray
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.text = value
        label.numberOfLines = 0
        return label
    }()
    
    func setText(_ text: String) {
        valueLabel.text = text
    }
}

extension PokemonDetailDescriptionView: ViewCodeProtocol {

    func setupHierarchy() {
        containerView.addSubview(titleLabel)
        containerView.addSubview(valueLabel)
        addSubview(containerView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])

        NSLayoutConstraint.activate([
            titleLabel.heightAnchor.constraint(equalTo: containerView.heightAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            valueLabel.heightAnchor.constraint(equalTo: containerView.heightAnchor),
            valueLabel.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 6),
            valueLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor)
        ])
    }
    
    func additionalSetup() {
        backgroundColor = .clear
    }
}

