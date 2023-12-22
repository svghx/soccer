//
//  Player.swift
//  Sports
//
//  Created by Sevgjan Haxhija on 12/22/23.
//

import Foundation

struct Player: Identifiable  {
    var id:String = UUID().uuidString
    var firstName: String
    var lastName: String
    var number: Int
    
    init(firstName: String = randomFirstName(), lastName: String = randomLastName(), number: Int = Int.random(in: 1...20)) {
        self.firstName = firstName
        self.lastName = lastName
        self.number = number
    }
    
    var fullName: String {
        let formatter = PersonNameComponentsFormatter()
        
        var components = PersonNameComponents()
        components.givenName = firstName
        components.familyName = lastName
        
        return formatter.string(from: components)
    }
}

extension Player {
    static func randomFirstName() -> String {
        let firstNameList = ["Henry", "William", "Geoffrey", "Jim", "Yvonne", "Jamie", "Leticia", "Priscilla", "Sidney", "Nancy", "Edmund", "Bill", "Megan", "Jack", "Jonah", "Gary", "Arthur", "Adrian", "Boris", "Roger"]
        return firstNameList.randomElement() ?? ""
    }
    
    static func randomLastName() -> String {
        let lastNameList = ["Pearson", "Adams", "Cole", "Francis", "Andrews", "Casey", "Gross", "Lane", "Thomas", "Patrick", "Strickland", "Nicolas", "Freeman", "Colman", "Jones", "McBlue", "Morisson", "Andrews", "Hears", "Jackson"]
        return lastNameList.randomElement() ?? ""
    }
    
    static func randomPlayers() -> [Player] {
        return Array(repeating: Player(), count: 11)
    }
}
