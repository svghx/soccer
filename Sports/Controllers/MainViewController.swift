//
//  MainViewController.swift
//  Sports
//
//  Created by Sevgjan Haxhija on 12/22/23.
//

import UIKit

class MainViewController: UIViewController, Storyboarded {
    weak var coordinator: Coordinator?
    var model: MainViewModel = MainViewModel()

    private let btnStart: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.setTitle("Start", for: .normal)
        button.layer.cornerRadius = 7
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Soccer League"
        // Do any additional setup after loading the view.
        setupUI()
    }
    
    func setupUI() {
        self.view.addSubview(btnStart)
        self.btnStart.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            btnStart.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            btnStart.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            btnStart.widthAnchor.constraint(equalToConstant: 200),
            btnStart.heightAnchor.constraint(equalToConstant: 45)
        ])
        self.btnStart.addTarget(self, action: #selector(didStart), for: .primaryActionTriggered)
    }
    
    @objc func didStart() {
        model.generateTeams()
        model.generateFixtures(teams: model.teams)
        coordinator?.showStandings(teams: model.teams, fixtures: model.fixtures)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
