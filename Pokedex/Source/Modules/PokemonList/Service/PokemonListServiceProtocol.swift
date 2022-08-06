//
//  PokemonListServiceProtocol.swift
//  Pokedex
//
//  Created by Matheus Cunha on 04/08/22.
//  Copyright © 2022 Matheus Cunha. All rights reserved.
//

import Foundation

protocol PokemonListServiceProtocol {

    func getPokemonList(onComplete: @escaping (Result<PokemonList, APIError>) -> Void)
    func getPokemon(id: String, onComplete: @escaping (Result<PokemonDetail, APIError>) -> Void)
}
