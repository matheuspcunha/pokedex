//
//  PokemonList.swift
//  Pokedex
//
//  Created by Matheus Cunha on 04/08/22.
//  Copyright © 2022 Matheus Cunha. All rights reserved.
//

import Foundation

struct PokemonList: Decodable {

    let results: [Pokemon]?
    
    init(results: [Pokemon]? = []) {
        self.results = results
    }
}


