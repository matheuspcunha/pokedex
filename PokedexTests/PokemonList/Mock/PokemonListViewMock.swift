//
//  PokemonListViewMock.swift
//  PokedexTests
//
//  Created by Matheus Cunha on 05/08/22.
//  Copyright © 2022 Matheus Cunha. All rights reserved.
//

import Foundation
@testable import Pokedex

final class PokemonListViewMock: PokemonListViewProtocol {
    
    var didCallReloadCollectionView = false
    var didCallShowLoading = false
    
    func reloadCollectionView() {
        didCallReloadCollectionView = true
    }
    
    func showLoading(_ show: Bool) {
        didCallShowLoading = true
    }
}
