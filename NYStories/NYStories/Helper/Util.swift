//
//  Util.swift
//  NYStories
//
//  Created by Maksim Chulkov on 17.05.2022.
//

import Foundation

class Util {
    static var shared = Util()
    func encodeUrl(_ url : String) -> String {
        return url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
    }
}
