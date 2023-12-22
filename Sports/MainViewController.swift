//
//  MainViewController.swift
//  Sports
//
//  Created by Sevgjan Haxhija on 12/22/23.
//

import UIKit

class MainViewController: UIViewController, Storyboarded {
    weak var coordinator: Coordinator?
    
    var teams:[Team] = []
    var fixtures:[Fixture] = []
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .clear
        tableView.estimatedRowHeight = 75
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(TeamCell.self, forCellReuseIdentifier: TeamCell.reuseIdentifier)
        tableView.register(FixtureCell.self, forCellReuseIdentifier: FixtureCell.reuseIdentifier)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Soccer League"
        
        // Do any additional setup after loading the view.
        teams = TeamGenerator.generateTeams()
        fixtures = FixtureGenerator.generateFixtures(teams: teams)
        
        fixtures.forEach { fixture in
            fixture.updatePoints()
        }
        
        setupTableView()
    }
    
    func setupTableView() {
        view.addSubview(tableView)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        // Sort teams based on points in descending order
        teams.sort { $0.points > $1.points }
        tableView.reloadData()
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? teams.count : fixtures.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: TeamCell.reuseIdentifier, for: indexPath) as? TeamCell else {
                fatalError("Failed to dequeue a reusable cell.")
            }
            
            let team = teams[indexPath.row]
            cell.configure(with: team)
            return cell
        default:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: FixtureCell.reuseIdentifier, for: indexPath) as? FixtureCell else {
                fatalError("Failed to dequeue a reusable cell.")
            }
            
            let fixture = fixtures[indexPath.row]
            cell.configure(with: fixture)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return section == 0 ? "Standings" : "Games"
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            let team = teams[indexPath.row]
            coordinator?.showDetails(team: team)
        }
    }
}
