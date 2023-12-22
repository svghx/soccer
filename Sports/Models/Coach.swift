//
//  Coach.swift
//  Sports
//
//  Created by Sevgjan Haxhija on 12/22/23.
//

import Foundation

struct Coach: Codable, Identifiable {
    var id:String = UUID().uuidString
    var firstName: String
    var lastName: String
    
    init(firstName: String = randomFirstName() , lastName: String = randomLastName()) {
        self.firstName = firstName
        self.lastName = lastName
    }
}

extension Coach {
    var fullName: String {
        let formatter = PersonNameComponentsFormatter()
        
        var components = PersonNameComponents()
        components.givenName = firstName
        components.familyName = lastName
        
        return formatter.string(from: components)
    }
    
    static func randomFirstName() -> String {
        let firstNameList = ["Liam", "Olivia", "Noah", "Emma", "Aiden", "Sophia", "Elijah", "Isabella", "Jackson", "Ava", "Lucas", "Mia", "Logan", "Amelia", "Caden", "Harper", "Mason", "Evelyn", "Oliver", "Abigail"]
        return firstNameList.randomElement() ?? ""
    }
    
    static func randomLastName() -> String {
        let lastNameList = ["Smith", "Johnson", "Williams", "Jones", "Brown", "Davis", "Miller", "Wilson", "Moore", "Taylor", "Anderson", "Thomas", "Jackson", "White", "Harris", "Martin", "Thompson", "Garcia", "Martinez", "Davis"]
        return lastNameList.randomElement() ?? ""
    }
    
}

extension Coach: Hashable {
    static func == (lhs: Coach, rhs: Coach) -> Bool {
        return lhs.firstName == rhs.firstName && lhs.lastName == rhs.lastName
    }
}
