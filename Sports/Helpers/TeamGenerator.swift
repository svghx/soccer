//
//  TeamGenerator.swift
//  Sports
//
//  Created by Sevgjan Haxhija on 12/22/23.
//

import Foundation

class TeamGenerator {
    
    // Function to generate teams team
    static func generateTeams(count: Int = 20) -> [Team] {
        var teams: [Team] = []
        
        // Generate teams based on count parameter
        for _ in 0..<count {
            let newTeam = newTeam(teams: teams)
            teams.append(newTeam)
        }
        
        return teams
    }
    
    static func newTeam(teams: [Team]) -> Team {
        let initialPoints = 0
        
        // Assign strengths and weaknesses
        let strength = Int.random(in: 1...10)
        let weakness = Int.random(in: 1...10)
        
        //Check if team exists in teams array, if so, create new
        var name = generateRandomTeamName()
        while teams.contains(where: {$0.name == name}) {
            name = generateRandomTeamName()
        }
        
        //Check if coach is already part of another team, if so, create new
        var coach = Coach()
        while teams.contains(where: {$0.coach.fullName == coach.fullName}) {
            coach = Coach()
        }
        
        let team = Team(name: name,
                        coach: coach,
                        players: Player.randomPlayers(),
                        points: initialPoints,
                        strength: strength,
                        weakness: weakness)
        
        return team
        
    }
    
    // Function to generate a random team name
    static func generateRandomTeamName() -> String {
        let adjectives = ["Swift", "Thunder", "Eagle", "Royal", "Phoenix", "Dynamic", "Velocity", "Blaze", "Majestic", "Blue",
                          "Green", "Yellow", "Dark", "Brown", "Magenta", "Cyan", "Navy", "Black", "White", "Advanced"]
        
        let nouns = ["Strikers", "Dragons", "Titans", "Warriors", "Riders", "Legends", "Raptors", "United", "Vortex", "Sharks",
                     "Bears", "Whales", "Turtles", "Rabbits", "Lions", "Tigers", "Ants", "Owls", "Foxes", "Cheetahs"]
        let randomAdjective = adjectives.randomElement() ?? ""
        let randomNoun = nouns.randomElement() ?? ""
        return "\(randomAdjective) \(randomNoun)"
    }
    
    
}
