//
//  GamesViewController.swift
//  Sports
//
//  Created by Sevgjan Haxhija on 12/22/23.
//

import UIKit

class GamesViewController: UIViewController {

    weak var coordinator: Coordinator?
    
    var team:Team?
    var fixtures:[Fixture] = []
    
    public convenience init(team: Team, fixtures: [Fixture]) {
        self.init(nibName: nil, bundle: nil)
        self.team = team
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
        tableView.register(FixtureCell.self, forCellReuseIdentifier: FixtureCell.reuseIdentifier)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Games"
        navigationItem.prompt = team?.name ?? ""
        view.backgroundColor = .white
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
    }
}

extension GamesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fixtures.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FixtureCell.reuseIdentifier, for: indexPath) as? FixtureCell else {
            fatalError("Failed to dequeue a reusable cell.")
        }
        
        let fixture = fixtures[indexPath.row]
        cell.configure(with: fixture)
        return cell
    }
}
