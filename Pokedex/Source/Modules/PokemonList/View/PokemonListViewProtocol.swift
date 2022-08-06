//
//  PokemonListViewProtocol.swift
//  Pokedex
//
//  Created by Matheus Cunha on 04/08/22.
//  Copyright © 2022 Matheus Cunha. All rights reserved.
//

import UIKit

protocol PokemonListViewProtocol: AnyObject {

    func reloadCollectionView()
    func showLoading(_ show: Bool)
}
