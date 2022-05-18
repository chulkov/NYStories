//
//  SceneDelegate.swift
//  NYStories
//
//  Created by Maksim Chulkov on 17.05.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
//        let sceneFactory = DefaultSceneFactory()
//        sceneFactory.builder = DefaultStoryListBuilder(sceneFactory: sceneFactory) //DefaultLoginSceneConfigurator(sceneFactory: sceneFactory)
        let initialScene = StoryListBuilder().build()
        let navController = UINavigationController(rootViewController: initialScene)
        window?.rootViewController = navController
        window?.makeKeyAndVisible()
    }


}

