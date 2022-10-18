//
//  HouseDetailViewModel.swift
//  gameofthrones
//
//  Created by MacBook Pro on 10/16/22.
//

import Foundation

class HouseDetailViewModel {
    private let houseUrl: String
    private let repository: GetHouseRepositoryProtocol
    
    init(houseUrl: String, repository: GetHouseRepositoryProtocol) {
        self.houseUrl = houseUrl
        self.repository = repository
    }
    
    func viewDidLoad(completion: @escaping (Result<House, Error>) -> Void) {
        fetchHouseDetails { result in
            switch result {
            case let .failure(error):
                completion(.failure(error))
            case let .success(data):
                completion(.success(data))
            }
        }
    }
    
    private func fetchHouseDetails(completion: @escaping (Result<House, Error>) -> Void) {
        repository.getHouse(url: URL(string: houseUrl)!) { result in
            switch result {
            case let .failure(error):
                completion(.failure(error))
            case let .success(data):
                completion(.success(data))
            }
        }
    }
}

enum HouseDetailViewModelAction: Equatable {
    
}
