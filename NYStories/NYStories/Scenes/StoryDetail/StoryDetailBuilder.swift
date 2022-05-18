//
//  StoryDetailBuilder.swift
//  NYStories
//
//  Created by Maksim Chulkov on 18.05.2022.
//

import Foundation

final class StoryDetailBuilder {
    func build(story: StoryList.Something.ViewModel.DisplayedStory) -> StoryDetailViewController {
        let viewController = StoryDetailViewController()
        let interactor = StoryDetailInteractor()
        let presenter = StoryDetailPresenter()
        let router = StoryDetailRouter(viewController: viewController)
        presenter.viewController = viewController
        interactor.presenter = presenter
        viewController.interactor = interactor
        viewController.router = router
        return viewController
    }
}
