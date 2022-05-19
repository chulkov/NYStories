//
//  AppDelegate.swift
//  NYStories
//
//  Created by Maksim Chulkov on 17.05.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        let initialScene = StoryListBuilder().build()
        let navController = UINavigationController(rootViewController: initialScene)
        window.rootViewController = navController
        window.makeKeyAndVisible()
        self.window = window
        return true
    }
}

