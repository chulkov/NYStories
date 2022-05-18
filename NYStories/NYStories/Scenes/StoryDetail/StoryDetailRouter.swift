//
//  StoryDetailRouter.swift
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

@objc protocol StoryDetailRoutingLogic
{
    func goBack()
  //func routeToSomewhere(segue: UIStoryboardSegue?)
}

protocol StoryDetailDataPassing
{
  var dataStore: StoryDetailDataStore? { get }
}

class StoryDetailRouter: NSObject, StoryDetailRoutingLogic//, StoryDetailDataPassing
{
//  weak var viewController: StoryDetailViewController?
//  var dataStore: StoryDetailDataStore?
  
    
    private weak var viewController: UIViewController?
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    func goBack() {
        self.viewController?.navigationController?.popViewController(animated: true)
    }
    
  // MARK: Routing
  
  //func routeToSomewhere(segue: UIStoryboardSegue?)
  //{
  //  if let segue = segue {
  //    let destinationVC = segue.destination as! SomewhereViewController
  //    var destinationDS = destinationVC.router!.dataStore!
  //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
  //  } else {
  //    let storyboard = UIStoryboard(name: "Main", bundle: nil)
  //    let destinationVC = storyboard.instantiateViewController(withIdentifier: "SomewhereViewController") as! SomewhereViewController
  //    var destinationDS = destinationVC.router!.dataStore!
  //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
  //    navigateToSomewhere(source: viewController!, destination: destinationVC)
  //  }
  //}

  // MARK: Navigation
  
  //func navigateToSomewhere(source: StoryDetailViewController, destination: SomewhereViewController)
  //{
  //  source.show(destination, sender: nil)
  //}
  
  // MARK: Passing data
  
  //func passDataToSomewhere(source: StoryDetailDataStore, destination: inout SomewhereDataStore)
  //{
  //  destination.name = source.name
  //}
    
    
}
