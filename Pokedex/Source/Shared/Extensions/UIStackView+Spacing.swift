//
//  UIStackView+Spacing.swift
//  Pokedex
//
//  Created by Matheus Cunha on 05/08/22.
//  Copyright © 2022 Matheus Cunha. All rights reserved.
//

import UIKit

extension UIStackView {

    func addSpacing(_ spacing: CGFloat) {
        let spacingView = UIView()

        switch axis {
        case .horizontal:
            NSLayoutConstraint.activate([spacingView.widthAnchor.constraint(equalToConstant: spacing)])
        case .vertical:
            NSLayoutConstraint.activate([spacingView.heightAnchor.constraint(equalToConstant: spacing)])
        default:
            return
        }

        addArrangedSubview(spacingView)
    }
}
