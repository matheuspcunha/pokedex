//
//  PokemonDetail.swift
//  Pokedex
//
//  Created by Matheus Cunha on 04/08/22.
//  Copyright © 2022 Matheus Cunha. All rights reserved.
//

import Foundation

struct PokemonDetail: Decodable {

    let id: Int
    let name: String
    let height: Int
    let weight: Int
    let abilities: [Abilities]
    let types: [Types]
    let forms: [Form]
    
    var idString: String { String(describing: id) }
    
    init(id: Int = 0,
         name: String = "",
         height: Int = 0,
         weight: Int = 0,
         abilities: [Abilities] = [],
         types: [Types] = [],
         forms: [Form] = []) {
        self.id = id
        self.name = name
        self.height = height
        self.weight = weight
        self.abilities = abilities
        self.types = types
        self.forms = forms
    }
}
