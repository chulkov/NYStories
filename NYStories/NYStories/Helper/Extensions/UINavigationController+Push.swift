//
//  UINavigationController+Push.swift
//  NYStories
//
//  Created by Maksim Chulkov on 19.05.2022.
//

import Foundation
import UIKit

extension UINavigationController {
    func handlePush(_ viewController: UIViewController, animated: Bool) {
        if let navigationController = viewController as? UINavigationController,
           let rootViewController = navigationController.rootViewController {
            self.pushViewController(rootViewController, animated: animated)
        } else {
            self.pushViewController(viewController, animated: animated)
        }
    }

    var rootViewController: UIViewController? {
        return viewControllers.first
    }
}
