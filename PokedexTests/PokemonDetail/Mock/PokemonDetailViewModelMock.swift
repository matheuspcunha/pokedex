//
//  PokemonDetailViewModelMock.swift
//  PokedexTests
//
//  Created by Matheus Cunha on 06/08/22.
//  Copyright © 2022 Matheus Cunha. All rights reserved.
//

import Foundation
@testable import Pokedex

final class PokemonDetailViewModelMock: PokemonDetailViewModelProtocol {
    
    var view: PokemonDetailViewProtocol?
    var pokemonDetail: PokemonDetail = PokemonDetail().mock()
}
