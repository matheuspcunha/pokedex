//
//  PokemonCellViewModel.swift
//  Pokedex
//
//  Created by Matheus Cunha on 04/08/22.
//  Copyright © 2022 Matheus Cunha. All rights reserved.
//

import UIKit

final class PokemonCellViewModel {
    
    private var pokemon: Pokemon
    
    init(pokemon: Pokemon) {
        self.pokemon = pokemon
    }
    
    var name: String {
        return pokemon.name.capitalized 
    }

    var id: String {
        return pokemon.id ?? ""
    }
}
