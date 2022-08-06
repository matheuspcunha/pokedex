//
//  UINavigationControllerMock.swift
//  PokedexTests
//
//  Created by Matheus Cunha on 06/08/22.
//  Copyright © 2022 Matheus Cunha. All rights reserved.
//

import UIKit

final class UINavigationControllerMock: UINavigationController {

    var pushedViewControllerMock: UIViewController?
    var presentedViewControllerMock: UIViewController?

    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        pushedViewControllerMock = viewController
    }

    override func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)? = nil) {
        presentedViewControllerMock =  viewControllerToPresent
    }
}
