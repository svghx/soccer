//
//  TeamViewModel.swift
//  Sports
//
//  Created by Sevgjan Haxhija on 12/22/23.
//

import Foundation

class TeamViewModel {
    var team:Team
    var fixtures:[Fixture]
    
    init(team: Team, fixtures: [Fixture]) {
        self.team = team
        self.fixtures = fixtures
    }
}
