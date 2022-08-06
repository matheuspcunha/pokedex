//
//  PokemonListCoordinatorTests.swift
//  PokedexTests
//
//  Created by Matheus Cunha on 06/08/22.
//  Copyright © 2022 Matheus Cunha. All rights reserved.
//

import XCTest
@testable import Pokedex

final class PokemonListCoordinatorTests: XCTestCase {

    var sut: PokemonListCoordinator!
    var navigationMock: UINavigationControllerMock!
    var viewModelMock: PokemonListViewModelMock!

    override func setUpWithError() throws {
        build()
    }

    override func tearDownWithError() throws {
        sut = nil
        navigationMock = nil
    }

    func testCoordinatorStart() throws {
        sut.start()
        XCTAssertTrue(navigationMock.pushedViewControllerMock is PokemonListViewController)
    }
    
    func testCallPokemonDetail() async {
        sut.showDetail(for: PokemonDetail().mock())
        let viewController = await navigationMock.presentedViewControllerMock
        
        XCTAssertTrue(viewController is PokemonDetailViewController)
    }

    func build() {
        viewModelMock = PokemonListViewModelMock()
        navigationMock = UINavigationControllerMock()
        sut = PokemonListCoordinator(navigationController: navigationMock)
    }
}
