//
//  CoordinatorProtocol.swift
//  Pokedex
//
//  Created by Matheus Cunha on 04/08/22.
//  Copyright © 2022 Matheus Cunha. All rights reserved.
//

import UIKit

protocol CoordinatorProtocol {

    var navigationController: UINavigationController { get }
    
    func start()
    func coordinate(to coordinator: CoordinatorProtocol)
}

extension CoordinatorProtocol {

    func coordinate(to coordinator: CoordinatorProtocol) {
        DispatchQueue.main.async {
            coordinator.start()
        }
    }
}
