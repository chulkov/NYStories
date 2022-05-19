//
//  StoryListBuilder.swift
//  NYStories
//
//  Created by Maksim Chulkov on 17.05.2022.
//

import Foundation

final class StoryListBuilder {
    func build() -> StoryListViewController {
        let viewController = StoryListViewController()
        let interactor = StoryListInteractor()
        let presenter = StoryListPresenter()
        let router = StoryListRouter(viewController: viewController)
        presenter.viewController = viewController
        interactor.presenter = presenter
        viewController.interactor = interactor
        viewController.router = router
        return viewController
    }
}
