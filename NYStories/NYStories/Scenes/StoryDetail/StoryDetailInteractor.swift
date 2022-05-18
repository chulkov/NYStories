//
//  StoryDetailInteractor.swift
//  NYStories
//
//  Created by Maksim Chulkov on 17.05.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol StoryDetailBusinessLogic
{
  func doSomething(request: StoryDetail.Something.Request)
}

protocol StoryDetailDataStore
{
  //var name: String { get set }
}

class StoryDetailInteractor: StoryDetailBusinessLogic, StoryDetailDataStore
{
  var presenter: StoryDetailPresentationLogic?
  var worker: StoryDetailWorker?
  //var name: String = ""
  
  // MARK: Do something
  
  func doSomething(request: StoryDetail.Something.Request)
  {
    worker = StoryDetailWorker()
    worker?.doSomeWork()
    
    let response = StoryDetail.Something.Response()
    presenter?.presentSomething(response: response)
  }
}