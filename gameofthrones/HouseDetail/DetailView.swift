//
//  DetailView.swift
//  gameofthrones
//
//  Created by MacBook Pro on 10/17/22.
//

import Foundation
import UIKit

class DetailView: UIView {
    
    private static let blackTextColor = UIColor.black
    
    
    let dragIndicatorView: DragIndicatorView = {
        let view = DragIndicatorView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 0
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.accessibilityIdentifier = "DetailView.StackView"
        return stackView
    }()
    let nameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = blackTextColor
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let regionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = blackTextColor
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let coatOfArmsLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = blackTextColor
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let wordsLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = blackTextColor
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let titlesLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = blackTextColor
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let seatsLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = blackTextColor
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let heirLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = blackTextColor
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let overloadLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = blackTextColor
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let foundedLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = blackTextColor
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let founderLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = blackTextColor
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let diedOutLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = blackTextColor
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let weaponsLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = blackTextColor
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let swornMembersLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = blackTextColor
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialise()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initialise() {
        addSubviews()
    }
    
    func configureView(house: House) {
        nameLabel.text = "House: \(house.name)"
        regionLabel.text = "Region: \(house.region)"
        coatOfArmsLabel.text = "Coat Of Arms: \(house.coatOfArms)"
        titlesLabel.text = "Titles: \(house.titles.joined(separator: ", "))"
        seatsLabel.text = "Seats: \(house.seats.joined(separator: ", "))"
        heirLabel.text = "Heir: \(house.heir)"
        foundedLabel.text = "Founded: \(house.founded)"
        founderLabel.text = "Founder: \(house.founder)"
        diedOutLabel.text = "DiedOut: \(house.diedOut)"
        weaponsLabel.text = "Ancestral Weapons: \(house.ancestralWeapons.joined(separator: ", "))"
        swornMembersLabel.text = "Sworn Members: \(house.swornMembers.count)"
        
    }

    private func addSubviews() {
        addDragIndicator()
        addSubview(stackView)
        
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(regionLabel)
        stackView.addArrangedSubview(coatOfArmsLabel)
        stackView.addArrangedSubview(titlesLabel)
        stackView.addArrangedSubview(seatsLabel)
        stackView.addArrangedSubview(heirLabel)
        stackView.addArrangedSubview(overloadLabel)
        stackView.addArrangedSubview(foundedLabel)
        stackView.addArrangedSubview(founderLabel)
        stackView.addArrangedSubview(diedOutLabel)
        stackView.addArrangedSubview(weaponsLabel)
        stackView.addArrangedSubview(swornMembersLabel)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: self.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            stackView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10),
            stackView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10)
        ])
    }
    
    private func addDragIndicator() {
        addSubview(dragIndicatorView)
        NSLayoutConstraint(item: dragIndicatorView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 6).isActive = true
        NSLayoutConstraint(item: dragIndicatorView, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: dragIndicatorView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 4).isActive = true
        NSLayoutConstraint(item: dragIndicatorView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 40).isActive = true
    }
}
