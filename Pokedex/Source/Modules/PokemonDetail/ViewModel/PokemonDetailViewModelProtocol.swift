//
//  PokemonDetailViewModelProtocol.swift
//  Pokedex
//
//  Created by Matheus Cunha on 04/08/22.
//  Copyright © 2022 Matheus Cunha. All rights reserved.
//

import Foundation

protocol PokemonDetailViewModelProtocol {

    var view: PokemonDetailViewProtocol? { get set }
    var pokemonDetail: PokemonDetail { get }
}
