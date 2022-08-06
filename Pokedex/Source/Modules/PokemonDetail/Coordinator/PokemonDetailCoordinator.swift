//
//  PokemonDetailCoordinator.swift
//  Pokedex
//
//  Created by Matheus Cunha on 04/08/22.
//  Copyright © 2022 Matheus Cunha. All rights reserved.
//

import UIKit

final class PokemonDetailCoordinator: CoordinatorProtocol {
    
    var navigationController: UINavigationController
    private var detail: PokemonDetail

    init(navigationController: UINavigationController,
         detail: PokemonDetail) {
        self.navigationController = navigationController
        self.detail = detail
    }
    
    func start() {
        let viewModel = PokemonDetailViewModel(coordinator: self, detail: detail)
        let pokemonDetailVC = PokemonDetailViewController(viewModel: viewModel)
        navigationController.modalPresentationStyle = .automatic
        navigationController.present(pokemonDetailVC, animated: true, completion: nil)
    }
}

extension PokemonDetailCoordinator: PokemonDetailCoordinatorProtocol {}
