//
//  Repository.swift
//  gameofthrones
//
//  Created by MacBook Pro on 10/16/22.
//

import Foundation

class Repository: RepositoryProtocol {}

protocol RepositoryProtocol {
    func get<T: Decodable>(url: URL, completion: @escaping (Result<T, Error>) -> Void)
}

extension RepositoryProtocol {
    func get<T: Decodable>(url: URL, completion: @escaping (Result<T, Error>) -> Void) {
        URLSession.shared.dataTask(with: url) { data, response, error in
          do {
            if let error = error {
              completion(.failure(error))
              return
            }
            guard let data = data else {
              preconditionFailure("No error was received but we also don't have data...")
            }
            let decodedObject = try JSONDecoder().decode(T.self, from: data)
            completion(.success(decodedObject))
          } catch {
            completion(.failure(error))
          }
        }.resume()
    }
}
