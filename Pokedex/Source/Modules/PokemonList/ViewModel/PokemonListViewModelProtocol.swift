//
//  PokemonListViewModelProtocol.swift
//  Pokedex
//
//  Created by Matheus Cunha on 04/08/22.
//  Copyright © 2022 Matheus Cunha. All rights reserved.
//

import Foundation

protocol PokemonListViewModelProtocol {

    var view: PokemonListViewProtocol? { get set }
    var countPokemons: Int { get }
    
    func fetchPokemonList()
    func fetchPokemon(by id: String)
    func openDetailFor(indexPath: IndexPath)
    func cellViewModelFor(at indexPath: IndexPath) -> PokemonCellViewModel
}
