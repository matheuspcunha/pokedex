//
//  Pokemon.swift
//  Pokedex
//
//  Created by Matheus Cunha on 05/08/22.
//  Copyright © 2022 Matheus Cunha. All rights reserved.
//

import Foundation

struct Pokemon: Decodable {

    let name: String
    var id: String?
    
    init(name: String = "", id: Int = 0) {
        self.name = name
        self.id = String(describing: id)
    }
}
