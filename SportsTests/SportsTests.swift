//
//  SportsTests.swift
//  SportsTests
//
//  Created by Sevgjan Haxhija on 12/22/23.
//

import XCTest
@testable import Sports

final class SportsTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

    func testGenerateTeams() {
        let teamCount = 20
        let teams = TeamGenerator.generateTeams(count: 20)
        
        XCTAssertEqual(teams.count, teamCount, "Generated teams count should be equal to the specified team count")
        
        for team in teams {
            XCTAssertFalse(team.name.isEmpty, "Team name should not be empty")
            XCTAssertNotNil(team.coach, "Team should have a coach")
            XCTAssertFalse(team.players.isEmpty, "Team should have players")
            XCTAssertTrue(team.strength >= 1 && team.strength <= 10, "Team strength should be within the valid range")
            XCTAssertTrue(team.weakness >= 1 && team.weakness <= 10, "Team weakness should be within the valid range")
        }
        
        // Check for uniqueness of team names
        let teamNames = teams.map { $0.name }
        XCTAssertEqual(Set(teamNames).count, teamCount, "Team names should be unique")
        
        // Check for uniqueness of coach names
        let coachNames = teams.map { $0.coach.fullName }
        XCTAssertEqual(Set(coachNames).count, teamCount, "Coach names should be unique")
    }
    
    
    func testTeamPlayAgainstAll() {
        let teams = TeamGenerator.generateTeams()
        let fixtures = FixtureGenerator.generateFixtures(teams: teams)
        
        for team in teams {
            var opponentsPlayed: Set<Team> = []
            for fixture in fixtures {
                opponentsPlayed.insert(fixture.homeTeam == team ? fixture.awayTeam : fixture.homeTeam)
            }
            
            // Assert that each team has played against every other team
            XCTAssertEqual(opponentsPlayed.count, teams.count - 1, "Team \(team.name) should play against every other team.")
        }
    }
}
