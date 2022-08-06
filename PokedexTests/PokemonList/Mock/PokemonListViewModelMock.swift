//
//  PokemonListViewModelMock.swift
//  PokedexTests
//
//  Created by Matheus Cunha on 06/08/22.
//  Copyright © 2022 Matheus Cunha. All rights reserved.
//

import Foundation
@testable import Pokedex

final class PokemonListViewModelMock: PokemonListViewModelProtocol {

    var view: PokemonListViewProtocol?
    var countPokemons: Int = 0
    
    func fetchPokemonList() {}
    func fetchPokemon(by: String) {}
    func openDetailFor(indexPath: IndexPath) {}

    func cellViewModelFor(at indexPath: IndexPath) -> PokemonCellViewModel {
        PokemonCellViewModel(pokemon: Pokemon())
    }
}
