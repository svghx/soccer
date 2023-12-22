//
//  FixtureCell.swift
//  Sports
//
//  Created by Sevgjan Haxhija on 12/22/23.
//

import UIKit

class FixtureCell: UITableViewCell {
    static let reuseIdentifier = String(describing: FixtureCell.self)
    
    var lblHomeTeam: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    var lblAwayTeam: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    var lblScore: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        addSubview(lblHomeTeam)
        addSubview(lblAwayTeam)
        addSubview(lblScore)

        NSLayoutConstraint.activate([
            lblHomeTeam.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            lblHomeTeam.topAnchor.constraint(equalTo: topAnchor, constant: 8),

            lblAwayTeam.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            lblAwayTeam.topAnchor.constraint(equalTo: topAnchor, constant: 8),

            lblScore.centerXAnchor.constraint(equalTo: centerXAnchor),
            lblScore.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(with fixture: Fixture) {
        lblHomeTeam.text = fixture.homeTeam.name
        lblAwayTeam.text = fixture.awayTeam.name
        lblScore.text = "\(fixture.homeScore) - \(fixture.awayScore)"
        
        let result = fixture.determineResult()
        lblHomeTeam.font = .systemFont(ofSize: 15, weight: result == .win ? .bold : .regular)
        lblAwayTeam.font = .systemFont(ofSize: 15, weight: result == .loss ? .bold : .regular)
    }
}

