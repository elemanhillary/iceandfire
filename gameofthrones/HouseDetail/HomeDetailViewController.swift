//
//  HomeDetailViewController.swift
//  gameofthrones
//
//  Created by MacBook Pro on 10/17/22.
//

import Foundation
import UIKit

class HomeDetailViewController: UIViewController {
    private let viewModel: HouseDetailViewModel
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
    
    lazy var customView = view as! DetailView
    
    override func loadView() {
        view = DetailView(frame: UIScreen.main.bounds)
    }

    init(viewModel: HouseDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        addLoader()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        viewModel.viewDidLoad { result in
            DispatchQueue.main.async {
                self.loadingLabel.isHidden = true
            }
            switch result {
            case let .failure(error):
                break
            case let .success(data):
                DispatchQueue.main.async {
                    self.customView.configureView(house: data)
                }
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    private func addLoader() {
        view.addSubview(loadingLabel)
        loadingLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loadingLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
}
