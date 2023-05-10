//
//  Characters.swift
//  Generic Network Layer
//
//  Created by Talha Batuhan Irmalı on 7.05.2023.
//

import Foundation

struct Character: Decodable {
    let id: Int
    let name, status, species, type: String
    let gender: String
    let origin: Origin
    let location: Location
    let image: String
    let episode: [String]
    let url: String
    let created: String
}

// MARK: - Location
struct Location: Decodable {
    var name: String?
    var url: String?
}

// MARK: - Origin
struct Origin: Decodable {
    var name: String?
    var url: String?
}
