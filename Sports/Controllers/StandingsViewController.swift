//
//  StandingsViewController.swift
//  Sports
//
//  Created by Sevgjan Haxhija on 12/22/23.
//

import UIKit

class StandingsViewController: UIViewController {
    weak var coordinator: Coordinator? = nil
    
    var teams:[Team] = []
    var fixtures:[Fixture] = []
    
    public convenience init(teams: [Team], fixtures: [Fixture]) {
        self.init(nibName: nil, bundle: nil)
        self.teams = teams
        self.fixtures = fixtures
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .white
        tableView.estimatedRowHeight = 75
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(TeamCell.self, forCellReuseIdentifier: TeamCell.reuseIdentifier)
        tableView.register(FixtureCell.self, forCellReuseIdentifier: FixtureCell.reuseIdentifier)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Standings"
        
        // Do any additional setup after loading the view.
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

extension StandingsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return teams.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TeamCell.reuseIdentifier, for: indexPath) as? TeamCell else {
            fatalError("Failed to dequeue a reusable cell.")
        }
        
        let team = teams[indexPath.row]
        cell.configure(with: team)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let team = teams[indexPath.row]
        let teamFixtures = fixtures.filter {
            return $0.homeTeam.name == team.name || $0.awayTeam.name == team.name
        }
        coordinator?.showGames(team: team, fixtures: teamFixtures)
    }
}
