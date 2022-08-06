//
//  AppDelegate.swift
//  Pokedex
//
//  Created by Matheus Cunha on 04/08/22.
//  Copyright © 2022 Matheus Cunha. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var coordinator: AppCoordinator!
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow()
        
        coordinator = AppCoordinator(window: window!)
        coordinator?.start()
        
        return true
    }
}
