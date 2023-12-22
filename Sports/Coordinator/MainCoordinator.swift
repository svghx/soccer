//
//  MainCoordinator.swift
//  Sports
//
//  Created by Sevgjan Haxhija on 12/22/23.
//

import UIKit

final class MainCoordinator: NSObject, Coordinator {
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = MainViewController.instantiate(.main)
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func showStandings(teams: [Team], fixtures: [Fixture]) {
        let vc = StandingsViewController(teams: teams, fixtures: fixtures)
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func showGames(team: Team, fixtures: [Fixture]) {
        let vc = GamesViewController(team: team, fixtures: fixtures)
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func showTeam(team: Team) {
        
    }
}
