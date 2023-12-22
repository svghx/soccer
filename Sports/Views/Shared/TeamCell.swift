//
//  TeamCell.swift
//  Sports
//
//  Created by Sevgjan Haxhija on 12/22/23.
//

import UIKit

class TeamCell: UITableViewCell {
    static let reuseIdentifier = String(describing: TeamCell.self)
    
    // Customize the cell based on your team properties
    var lblName: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var lblPoints: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    func setup() {
        contentView.addSubview(lblName)
        contentView.addSubview(lblPoints)
        
        NSLayoutConstraint.activate([
            lblName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            lblName.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            lblPoints.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            lblPoints.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    func configure(with team: Team) {
        lblName.text = team.name
        lblPoints.text = "Points: \(team.points)"
    }
    
}
