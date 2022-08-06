//
//  PokemonListServiceMock.swift
//  PokedexTests
//
//  Created by Matheus Cunha on 05/08/22.
//  Copyright © 2022 Matheus Cunha. All rights reserved.
//

import XCTest
@testable import Pokedex

final class PokemonListServiceMock: PokemonListServiceProtocol {
    
    var pokemonListResult: Result<PokemonList, APIError>?
    var pokemonResult: Result<PokemonDetail, APIError>?

    func getPokemonList(onComplete: @escaping (Result<PokemonList, APIError>) -> Void) {
        guard let pokemonListResult = pokemonListResult else { return }
        onComplete(pokemonListResult)
    }
    
    func getPokemon(id: String, onComplete: @escaping (Result<PokemonDetail, APIError>) -> Void) {
        guard let pokemonResult = pokemonResult else { return }
        onComplete(pokemonResult)
    }
}

extension PokemonList {

    func mock() -> PokemonList {
        guard let urlPath = Bundle(for: PokemonListServiceMock.self).url(forResource: "PokemonList", withExtension: "json"),
              let jsonString = (try? String(contentsOf: urlPath, encoding: .utf8)),
              let data = jsonString.data(using: .utf8),
              let list = (try? JSONDecoder().decode(PokemonList.self, from: data))
        else { return PokemonList() }

        return list
    }
}

extension PokemonDetail {

    func mock() -> PokemonDetail {
        guard let urlPath = Bundle(for: PokemonListServiceMock.self).url(forResource: "PokemonDetail", withExtension: "json"),
              let jsonString = (try? String(contentsOf: urlPath, encoding: .utf8)),
              let data = jsonString.data(using: .utf8),
              let detail = (try? JSONDecoder().decode(PokemonDetail.self, from: data))
        else { return PokemonDetail() }

        return detail
    }
}
