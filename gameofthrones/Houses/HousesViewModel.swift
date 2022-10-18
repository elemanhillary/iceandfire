//
//  HousesViewModel.swift
//  gameofthrones
//
//  Created by MacBook Pro on 10/16/22.
//

import Foundation
import UIKit

class HousesViewModel: NSObject {
    private let apiUrl: String
    private let repository: GetHousesRepositoryProtocol
    private let requestAction: (HousesViewModelAction) -> Void
    
    
    private var data: [House] = []
    
    init(apiUrl: String, repository: GetHousesRepositoryProtocol, requestAction: @escaping (HousesViewModelAction) -> Void) {
        self.apiUrl = apiUrl
        self.repository = repository
        self.requestAction = requestAction
    }
    
    func viewDidLoad(completion: @escaping (_ error: Error?) -> Void) {
        fetchHouses { result in
            switch result {
            case let .failure(error):
                completion(error)
            case let .success(data):
                self.data = data
                completion(nil)
            }
        }
    }
    
    private func fetchHouses(completion: @escaping (Result<[House], Error>) -> Void) {
        repository.getHouses(url: URL(string: apiUrl)!) { result in
            switch result {
            case let .failure(error):
                completion(.failure(error))
            case let .success(data):
                completion(.success(data))
            }
        }
    }
}

extension HousesViewModel {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HouseViewCell.description(), for: indexPath) as? HouseViewCell else {
            return UITableViewCell()
        }
        cell.configure(from: self.data[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let url = data[indexPath.row].url
        DispatchQueue.main.async {
            self.requestAction(.showHouse(houseUrl: url))
        }
    }
}

enum HousesViewModelAction: Equatable {
    case showHouse(houseUrl: String)
}
