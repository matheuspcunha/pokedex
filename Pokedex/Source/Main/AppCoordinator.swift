//
//  AppCoordinator.swift
//  Pokedex
//
//  Created by Matheus Cunha on 04/08/22.
//  Copyright © 2022 Matheus Cunha. All rights reserved.
//

import UIKit

final class AppCoordinator: CoordinatorProtocol {
    
    let navigationController: UINavigationController
    private let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
        self.navigationController = UINavigationController()
    }
    
    func start() {
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        
        self.showPokemonList()
    }
    
    private func showPokemonList() {
        let startCoordinator = PokemonListCoordinator(navigationController: navigationController)
        coordinate(to: startCoordinator)
    }
}
