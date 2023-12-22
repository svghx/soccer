//
//  TeamProtocol.swift
//  Sports
//
//  Created by Sevgjan Haxhija on 12/22/23.
//

import Foundation

protocol TeamProtocol {
    var name: String { get }
    var coach: Coach { get }
    var players: [Player] { get }
    var strength: Int { get }
    var weakness: Int { get }

    
    func calculateGoalDifference(injuryFactor: Double, teamMoraleFactor: Double) -> Double
}
