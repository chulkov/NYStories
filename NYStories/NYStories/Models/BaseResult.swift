//
//  BaseResult.swift
//  NYStories
//
//  Created by Maksim Chulkov on 17.05.2022.
//

import Foundation

public class BaseResult<T: Decodable> : Decodable {

    var results: [T]?
    
    init(){}
    
    enum CodingKeys: String, CodingKey {
        case results
    }
    
    required public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        results = try values.decodeIfPresent([T].self , forKey: .results)!
    }
}
