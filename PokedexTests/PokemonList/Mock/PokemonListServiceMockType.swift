//
//  PokemonListServiceMockType.swift
//  PokedexTests
//
//  Created by  Cunha on 06/08/22.
//  Copyright © 2022 Matheus Cunha. All rights reserved.
//

import Foundation
@testable import Pokedex

enum PokemonListServiceMockType {

    case success, failure

    var service: PokemonListServiceMock {
        let serviceMock = PokemonListServiceMock()

        switch self {
        case .success:
            serviceMock.pokemonListResult = .success(PokemonList().mock())
            serviceMock.pokemonResult = .success(PokemonDetail().mock())
        case .failure:
            serviceMock.pokemonListResult = .failure(.noData)
            serviceMock.pokemonResult = .failure(.noData)
        }

        return serviceMock
    }
}
