//
//  PokemonDetailCoordinatorTests.swift
//  PokedexTests
//
//  Created by Matheus Cunha on 06/08/22.
//  Copyright © 2022 Matheus Cunha. All rights reserved.
//

import XCTest
@testable import Pokedex

final class PokemonDetailCoordinatorTests: XCTestCase {

    var sut: PokemonDetailCoordinator!
    var navigationMock: UINavigationControllerMock!
    var viewModelMock: PokemonDetailViewModelMock!

    override func setUpWithError() throws {
        build()
    }

    override func tearDownWithError() throws {
        sut = nil
        navigationMock = nil
    }

    func testCoordinatorStart() throws {
        sut.start()
        XCTAssertTrue(navigationMock.presentedViewControllerMock is PokemonDetailViewController)
    }

    func build() {
        viewModelMock = PokemonDetailViewModelMock()
        navigationMock = UINavigationControllerMock()
        sut = PokemonDetailCoordinator(navigationController: navigationMock,
                                       detail: PokemonDetail().mock())
    }
}
