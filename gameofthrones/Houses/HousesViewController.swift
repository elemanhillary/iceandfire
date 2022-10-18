//
//  HousesViewController.swift
//  gameofthrones
//
//  Created by MacBook Pro on 10/16/22.
//

import Foundation
import UIKit

class HousesViewController: UIViewController {
    private let viewModel: HousesViewModel
    
    lazy var customView = view as! HousesView
    
    var tableView: UITableView {
        return customView.tableView
    }
    
    let loadingLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .black
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textAlignment = .center
        label.text = "Loading..."
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func loadView() {
        view = HousesView(frame: UIScreen.main.bounds)
    }
    
    init(viewModel: HousesViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        addLoader()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        self.viewModel.viewDidLoad { _ in
            DispatchQueue.main.async {
                self.loadingLabel.isHidden = true
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    private func setupTableView() {
        tableView.register(HouseViewCell.self, forCellReuseIdentifier: HouseViewCell.description())
        tableView.delegate = self
        tableView.dataSource = self
        tableView.contentInset.bottom = 40
    }
    
    private func addLoader() {
        view.addSubview(loadingLabel)
        loadingLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loadingLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
}

extension HousesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.tableView(tableView, numberOfRowsInSection: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return viewModel.tableView(tableView, cellForRowAt: indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return viewModel.tableView(tableView, heightForRowAt: indexPath)
    }
        
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.tableView(tableView, didSelectRowAt: indexPath)
    }
}
