//
//  PokemonListCoordinator.swift
//  Pokedex
//
//  Created by Matheus Cunha on 04/08/22.
//  Copyright © 2022 Matheus Cunha. All rights reserved.
//

import UIKit

final class PokemonListCoordinator: CoordinatorProtocol {
    
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewModel = PokemonListViewModel(coordinator: self)
        let pokemonListVC = PokemonListViewController(viewModel: viewModel)
        navigationController.pushViewController(pokemonListVC, animated: true)
    }
}

extension PokemonListCoordinator: PokemonListCoordinatorProtocol {

    func showDetail(for pokemonDetail: PokemonDetail) {
        let pokemonDetail = PokemonDetailCoordinator(
            navigationController: navigationController,
            detail: pokemonDetail
        )
        coordinate(to: pokemonDetail)
    }
}
