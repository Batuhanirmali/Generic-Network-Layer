//
//  NetworkManager.swift
//  Generic Network Layer
//
//  Created by Talha Batuhan Irmalı on 7.05.2023.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    private func request<T: Decodable>(_ endpoint: Endpoint, completion: @escaping (Result<T ,Error>) -> Void) {
        let task = URLSession.shared.dataTask(with: endpoint.request()) { data, response, error in
            
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let response = response as? HTTPURLResponse, response.statusCode >= 200, response.statusCode <= 299 else {
                completion(.failure(NSError(domain: "Invalid Response", code: 0)))
                return
            }
            guard let data = data else {
                completion(.failure(NSError(domain: "Invalid Response data", code: 0)))
                return
            }
            do {
                let decodedData = try JSONDecoder().decode(T.self, from: data)
                completion(.success(decodedData))
            }catch let error {
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
    func getLocations(LocationID: String,completion: @escaping (Result<LocationModel, Error>) -> Void) {
        let endpoint = Endpoint.getLocations(LocationID: LocationID)
        request(endpoint, completion: completion)
    }
    
    func getCharacters(CharacterID:String ,completion: @escaping (Result<Character, Error>) -> Void) {
        let endpoint = Endpoint.getChar(CharacterID: CharacterID)
        request(endpoint, completion: completion)
    }
    
}
