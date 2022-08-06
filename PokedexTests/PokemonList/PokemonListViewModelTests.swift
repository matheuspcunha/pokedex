//
//  PokemonListViewModelTests.swift
//  PokedexTests
//
//  Created by Matheus Cunha on 05/08/22.
//  Copyright © 2022 Matheus Cunha. All rights reserved.
//

import XCTest
@testable import Pokedex

final class PokemonListViewModelTests: XCTestCase {

    var sut: PokemonListViewModel!
    var coordinatorMock: PokemonListCoordinatorMock!
    var viewMock: PokemonListViewMock!
    var serviceMock: PokemonListServiceMock!
    
    override func setUpWithError() throws {
        build()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func testFetchPokemonListSuccess() {
        sut.fetchPokemonList()

        XCTAssertTrue(viewMock.didCallShowLoading)
        XCTAssertTrue(viewMock.didCallReloadCollectionView)
        XCTAssertFalse(coordinatorMock.didCallShowAlert)
    }

    func testFetchPokemonListFailure() {
        build(serviceType: .failure)
        sut.fetchPokemonList()

        XCTAssertTrue(viewMock.didCallShowLoading)
        XCTAssertFalse(viewMock.didCallReloadCollectionView)
        XCTAssertTrue(coordinatorMock.didCallShowAlert)
    }

    func testFetchPokemonDetailSuccess() {
        sut.fetchPokemon(by: "ditto")

        XCTAssertTrue(viewMock.didCallShowLoading)
        XCTAssertTrue(viewMock.didCallReloadCollectionView)
        XCTAssertFalse(coordinatorMock.didCallShowAlert)
    }

    func testFetchPokemonDetailFailure() {
        build(serviceType: .failure)
        sut.fetchPokemon(by: "ditto")

        XCTAssertTrue(viewMock.didCallShowLoading)
        XCTAssertFalse(viewMock.didCallReloadCollectionView)
        XCTAssertTrue(coordinatorMock.didCallShowAlert)
    }

    func testOpenDetail() {
        let indexPath = IndexPath(row: 1, section: 1)

        sut.fetchPokemonList()
        sut.openDetailFor(indexPath: indexPath)

        XCTAssertTrue(coordinatorMock.didCallShowDetail)
    }
    
    func testCountPokemon() {
        sut.fetchPokemonList()
        
        XCTAssertEqual(sut.countPokemons, 2)
    }
    
    func testView() {
        XCTAssertTrue((sut.view as Any) is PokemonListViewProtocol)
    }
    
    func testCellViewModel() {
        let indexPath = IndexPath(row: 1, section: 1)

        sut.fetchPokemonList()
    
        XCTAssertTrue((sut.cellViewModelFor(at: indexPath) as Any) is PokemonCellViewModel)
    }

    func build(serviceType: PokemonListServiceMockType = .success) {
        coordinatorMock = PokemonListCoordinatorMock()
        serviceMock = serviceType.service
        viewMock = PokemonListViewMock()
        sut = PokemonListViewModel(coordinator: coordinatorMock,
                                   service: serviceMock)
        sut.view = viewMock
    }
}
