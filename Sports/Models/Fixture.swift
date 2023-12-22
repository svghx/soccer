//
//  Fixture.swift
//  Sports
//
//  Created by Sevgjan Haxhija on 12/22/23.
//

import Foundation

struct Fixture: Identifiable {
    var id:String = UUID().uuidString
    var homeTeam: Team
    var awayTeam: Team
    var homeScore: Int
    var awayScore: Int

    init(homeTeam: Team, awayTeam: Team, homeScore: Int, awayScore: Int) {
        self.homeTeam = homeTeam
        self.awayTeam = awayTeam
        self.homeScore = homeScore
        self.awayScore = awayScore
    }
    
    func updatePoints() {
        if homeScore > awayScore {
            homeTeam.updatePoints(points: 3)
        } else if homeScore < awayScore {
            awayTeam.updatePoints(points: 3)
        } else {
            homeTeam.updatePoints(points: 1)
            awayTeam.updatePoints(points: 1)
        }
    }
    
    func determineResult() -> FixtureResult {
        if homeScore > awayScore {
            return .win
        } else if homeScore < awayScore {
            return .loss
        } else {
            return .draw
        }
    }
    
//    func updatePoints(for team: inout Team, result: FixtureResult) {
//        switch result {
//        case .win:
//            team.points += 3
//        case .draw:
//            team.points += 1
//        case .loss:
//            // No points for a loss
//            break
//        }
//    }
}
