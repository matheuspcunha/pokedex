//
//  PokemonListCoordinatorProtocol.swift
//  Pokedex
//
//  Created by Matheus Cunha on 04/08/22.
//  Copyright © 2022 Matheus Cunha. All rights reserved.
//

import Foundation

protocol PokemonListCoordinatorProtocol: AnyObject, ShowAlert {

    func showDetail(for pokemonDetail: PokemonDetail)
}

