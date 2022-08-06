//
//  Alert.swift
//  Pokedex
//
//  Created by Matheus Cunha on 06/08/22.
//  Copyright © 2022 Matheus Cunha. All rights reserved.
//

import UIKit

class Alert {

    static func make(title: String?, message: String? = nil, handler: (() -> Void)? = nil) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .cancel, handler: { action in
            guard let handler = handler else {return}
            handler()
        })
        alert.addAction(okAction)
        
        return alert
    }
}
