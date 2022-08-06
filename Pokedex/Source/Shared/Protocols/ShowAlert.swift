//
//  ShowAlert.swift
//  Pokedex
//
//  Created by Matheus Cunha on 06/08/22.
//  Copyright © 2022 Matheus Cunha. All rights reserved.
//

import UIKit

protocol ShowAlert {
    
    func showAlert(_ alert: UIAlertController)
}

extension ShowAlert where Self: CoordinatorProtocol {
    
    func showAlert(_ alert: UIAlertController) {
        DispatchQueue.main.async {
            self.navigationController.present(alert, animated: true, completion: nil)
        }
    }
}
