//
//  CoordinatorProtocol.swift
//  Sports
//
//  Created by Sevgjan Haxhija on 12/22/23.
//

import UIKit

protocol Coordinator: NSObject {
    var navigationController: UINavigationController {get set}
        
    func start()
    func showStandings(teams: [Team], fixtures: [Fixture])
    func showGames(team: Team, fixtures: [Fixture])
    func showTeam(team: Team)
}
