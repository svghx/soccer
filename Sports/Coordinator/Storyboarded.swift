//
//  Storyboarded.swift
//  Sports
//
//  Created by Sevgjan Haxhija on 12/22/23.
//

import UIKit

enum StoryBoardName: String {
    case main
    
    fileprivate var instance: UIStoryboard {
        return UIStoryboard(name: rawValue.capitalized, bundle: Bundle.main)
    }
}

protocol Storyboarded {
    static func instantiate(_ storyBoardName: StoryBoardName) -> Self
}

extension Storyboarded where Self: UIViewController {
    
    static func instantiate(_ storyBoardName: StoryBoardName) -> Self {
        let storyboard = storyBoardName.instance
        let viewController = storyboard.instantiateViewController(identifier: self.identifier) as! Self
        return viewController
    }
}
