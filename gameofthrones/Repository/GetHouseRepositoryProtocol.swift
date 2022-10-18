//
//  GetHouseRepositoryProtocol.swift
//  gameofthrones
//
//  Created by MacBook Pro on 10/16/22.
//

import Foundation

protocol GetHouseRepositoryProtocol {
    var repository: RepositoryProtocol { get }
    func getHouse(url: URL, completion: @escaping (Result<House, Error>) -> Void)
}

class GetHouseRepository: GetHouseRepositoryProtocol {
    var repository: RepositoryProtocol = Repository()
}

extension GetHouseRepositoryProtocol {
    func getHouse(url: URL, completion: @escaping (Result<House, Error>) -> Void) {
        repository.get(url: url, completion: completion)
    }
}
