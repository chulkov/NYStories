//
//  StoryWorker.swift
//  NYStories
//
//  Created by Maksim Chulkov on 17.05.2022.
//

import Foundation

public class StoryWorker {
    
    func getStoriesList(_ completion: @escaping ([Story]) -> ()) {
        NetworkAdapter.shared.request(AppConst.topStories) {  (response : BaseResult<Story>) in
            completion(response.results!)
        } failure: {
            print("getStoriesList failure")
        }
    }
    
}
