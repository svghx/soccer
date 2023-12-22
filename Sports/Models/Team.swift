//
//  Team.swift
//  Sports
//
//  Created by Sevgjan Haxhija on 12/22/23.
//

import Foundation

class Team: TeamProtocol, Identifiable  {
    var id:String = UUID().uuidString
    var name: String
    var coach: Coach
    var players: [Player]
    var strength: Int
    var weakness: Int
    
    var points: Int
    var logo: String?
    
    init(name: String, coach: Coach, players: [Player], points: Int, logo: String? = nil, strength: Int, weakness: Int) {
        self.name = name
        self.coach = coach
        self.players = players
        self.points = points
        self.logo = logo
        self.strength = strength
        self.weakness = weakness
    }
    
    func calculateGoalDifference(injuryFactor: Double, teamMoraleFactor: Double) -> Double {
        // Simulate goal difference based on overall team strength, player skills, and team strategy
        let baseGoalDifference = Double.random(in: 0...3)
        
        // Calculate the final goal difference considering overall team strength, player skills, and team strategy
        var finalGoalDifference = baseGoalDifference * Double(strength) * injuryFactor * teamMoraleFactor
        
        finalGoalDifference = min(max(finalGoalDifference, 0), 5)
        
        return finalGoalDifference
    }
    
    func updatePoints(points: Int) {
        self.points += points
//        switch result {
//        case .win:
//            self.points += points
//        case .draw:
//            self.points +=
//        case .loss:
//            // No points for a loss
//            break
//        }
    }
}

extension Team: Hashable {
    
    public func hash(into hasher: inout Hasher) {
        return hasher.combine(name)
    }
    
    static func == (lhs: Team, rhs: Team) -> Bool {
        return lhs.name == rhs.name
    }
}
