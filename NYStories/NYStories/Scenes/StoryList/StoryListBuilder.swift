//
//  StoryListBuilder.swift
//  NYStories
//
//  Created by Maksim Chulkov on 17.05.2022.
//

import Foundation

final class StoryListBuilder {
//    private var sceneFactory: SceneFactory
//
//    init(sceneFactory: SceneFactory) {
//        self.sceneFactory = sceneFactory
//    }
//
//    @discardableResult
//    func build(_ vc: StoryListViewController) -> StoryListViewController {
//        sceneFactory.builder = self
////        let service = DefaultAuthService(
////            networkManager: DefaultNetworkManager(session: MockNetworkSession())
////        )
//        let worker = StoryListWorker()
//        let interactor = StoryListInteractor()
//        let presenter = StoryListPresenter()
//        let router = StoryListRouter()
////        router.source = vc
//        presenter.viewController = vc
//        interactor.presenter = presenter
////        interactor.worker = worker
//        vc.interactor = interactor
//        vc.router = router
//        return vc
//    }
    
    func build() -> StoryListViewController {
//        sceneFactory.builder = self
        //        let service = DefaultAuthService(
        //            networkManager: DefaultNetworkManager(session: MockNetworkSession())
        //        )
        
        let viewController = StoryListViewController()
//        let worker = StoryListWorker()
        let interactor = StoryListInteractor()
        let presenter = StoryListPresenter()
        let router = StoryListRouter(viewController: viewController)
        //        router.source = vc
        presenter.viewController = viewController
        interactor.presenter = presenter
        //        interactor.worker = worker
        viewController.interactor = interactor
        viewController.router = router
        return viewController
    }
}
