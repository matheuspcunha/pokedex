//
//  PokemonDetailViewModelTests.swift
//  PokedexTests
//
//  Created by Matheus Cunha on 05/08/22.
//  Copyright © 2022 Matheus Cunha. All rights reserved.
//

import XCTest
@testable import Pokedex

final class PokemonDetailViewModelTests: XCTestCase {

    var sut: PokemonDetailViewModel!
    var coordinatorMock: PokemonDetailCoordinatorMock!
    var viewMock: PokemonDetailViewMock!

    override func setUpWithError() throws {
        build()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func testPokemonDetail() {
        XCTAssertEqual(sut.pokemonDetail.id, 1)
        XCTAssertEqual(sut.pokemonDetail.name, "ditto")
        XCTAssertEqual(sut.pokemonDetail.height, 3)
        XCTAssertEqual(sut.pokemonDetail.weight, 40)
    }

    func testView() {
        XCTAssertTrue((sut.view as Any) is PokemonDetailViewProtocol)
    }

    func build() {
        coordinatorMock = PokemonDetailCoordinatorMock()
        viewMock = PokemonDetailViewMock()
        sut = PokemonDetailViewModel(coordinator: coordinatorMock,
                                     detail: PokemonDetail().mock())
        sut.view = viewMock
    }
}
