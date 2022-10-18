//
//  GetHousesRepositoryProtocol.swift
//  gameofthrones
//
//  Created by MacBook Pro on 10/16/22.
//

import Foundation

protocol GetHousesRepositoryProtocol {
    var repository: RepositoryProtocol { get }
    func getHouses(url: URL, completion: @escaping (Result<[House], Error>) -> Void)
}

class GetHousesRepository: GetHousesRepositoryProtocol {
    var repository: RepositoryProtocol = Repository()
}

extension GetHousesRepositoryProtocol {
    func getHouses(url: URL, completion: @escaping (Result<[House], Error>) -> Void) {
        repository.get(url: url, completion: completion)
    }
}
