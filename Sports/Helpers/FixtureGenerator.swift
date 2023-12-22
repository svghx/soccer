//
//  FixtureGenerator.swift
//  Sports
//
//  Created by Sevgjan Haxhija on 12/22/23.
//

import Foundation

class FixtureGenerator {
    static func generateFixtures(teams: [Team]) -> [Fixture] {
//        var allFixtures:[Fixture] = []
//        for i in 0..<teams.count {
//            let homeTeam = teams[i]
//            
//            for j in 0..<teams.count where i != j {
//                let awayTeam = teams[j]
//                
//                // Simulate home and away fixtures
//                let homeFixture = generateFixture(homeTeam: homeTeam, awayTeam: awayTeam)
//                let awayFixture = generateFixture(homeTeam: awayTeam, awayTeam: homeTeam)
//                
//                allFixtures.append(homeFixture)
//                allFixtures.append(awayFixture)
//            }
//        }
        
        let allFixtures = teams.flatMap { homeTeam in
            teams.filter { $0.name != homeTeam.name }.map { awayTeam in
                generateFixture(homeTeam: homeTeam, awayTeam: awayTeam)
            }
        }
        
        return allFixtures.shuffled()
    }
    
    static func generateFixture(homeTeam: Team, awayTeam: Team) -> Fixture {
        let homeScore = simulateScore(for: homeTeam)
        let awayScore = simulateScore(for: awayTeam)
        
        return Fixture(homeTeam: homeTeam, awayTeam: awayTeam, homeScore: homeScore, awayScore: awayScore)
    }
    
    static func simulateScore(for team: Team) -> Int {
        // Simulate factors like injury, team morale, etc.
        let injuryFactor = Double.random(in: 0.5...1.0)
        let teamMoraleFactor = Double.random(in: 0.8...1.0)
        // Calculate the score based on the overall team strength and additional factors
        let score = Int(Double(team.calculateGoalDifference(injuryFactor: injuryFactor, teamMoraleFactor: teamMoraleFactor)))
        
        return score
    }
    
}
