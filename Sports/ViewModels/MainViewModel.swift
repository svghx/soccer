//
//  MainViewModel.swift
//  Sports
//
//  Created by Sevgjan Haxhija on 12/22/23.
//

import Foundation

class MainViewModel {
    
    var teams:[Team] = []
    var fixtures:[Fixture] = []
    
    func generateTeams() {
        teams = TeamGenerator.generateTeams()
    }
    
    func generateFixtures(teams: [Team]) {
        fixtures = FixtureGenerator.generateFixtures(teams: teams)
        fixtures.forEach { fixture in
            fixture.updatePoints()
        }
    }
}
