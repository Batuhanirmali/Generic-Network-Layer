//
//  Characters.swift
//  Generic Network Layer
//
//  Created by Talha Batuhan Irmalı on 7.05.2023.
//

import Foundation

struct CharacterModel: Decodable {
    var results: [CharacterDetail]?
}

struct CharacterDetail: Decodable {
    var id: Int?
    var name: String?
    var type: String?
    var origin, location: Location?
    var image: String?
    var episode: [String]?
    var url: String?
    var created: String?
}

// MARK: - Location
struct Location: Codable {
    var name: String?
    var url: String?
}

// MARK: - Origin
struct Origin: Codable {
    var name: String?
    var url: String?
}
