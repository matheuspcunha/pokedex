//
//  PokemonDetailViewModel.swift
//  Pokedex
//
//  Created by Matheus Cunha on 04/08/22.
//  Copyright © 2022 Matheus Cunha. All rights reserved.
//

import Foundation

final class PokemonDetailViewModel {
    
    weak var view: PokemonDetailViewProtocol?
    
    private var coordinator: PokemonDetailCoordinatorProtocol?
    private var detail: PokemonDetail

    init(coordinator: PokemonDetailCoordinatorProtocol,
         detail: PokemonDetail) {
        self.coordinator = coordinator
        self.detail = detail
    }
}

extension PokemonDetailViewModel: PokemonDetailViewModelProtocol {

    var pokemonDetail: PokemonDetail { return detail }
}
