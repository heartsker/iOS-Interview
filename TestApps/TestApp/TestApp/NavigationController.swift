//
//  NavigationController.swift
//  TestApp
//
//  Created by Daniel Pustotin on 20.01.2024.
//

import UIKit

class NavigationController: UINavigationController {
    override func viewDidLoad() {
        let rootViewController = TestResponderChainViewController()

        pushViewController(rootViewController, animated: false)
    }
}
