//
//  PokemonListCoordinatorMock.swift
//  PokedexTests
//
//  Created by Matheus Cunha on 05/08/22.
//  Copyright © 2022 Matheus Cunha. All rights reserved.
//

import UIKit
@testable import Pokedex

final class PokemonListCoordinatorMock: PokemonListCoordinatorProtocol {
    
    var didCallShowDetail = false
    var didCallShowAlert = false

    func showAlert(_ alert: UIAlertController) {
        didCallShowAlert = true
    }
    
    func showDetail(for pokemonDetail: PokemonDetail) {
        didCallShowDetail = true
    }
}
