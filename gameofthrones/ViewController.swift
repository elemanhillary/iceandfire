//
//  ViewController.swift
//  gameofthrones
//
//  Created by MacBook Pro on 10/16/22.
//

import UIKit

class ViewController: CardHolderViewController {
    let topViewController = UIViewController.init()
    let fireAndIceLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .white
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textAlignment = .center
        label.text = "FIRE AND ICE"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let flowRunner = FlowRunner()
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        topViewController.view.addSubview(fireAndIceLabel)
        fireAndIceLabel.centerXAnchor.constraint(equalTo: topViewController.view.centerXAnchor).isActive = true
        fireAndIceLabel.centerYAnchor.constraint(equalTo: topViewController.view.centerYAnchor).isActive = true
        setTopChildViewController(topViewController)
        flowRunner.runHomeFlow(parentView: self, apiUrl: "https://anapioficeandfire.com/api/houses/")
    }
}

