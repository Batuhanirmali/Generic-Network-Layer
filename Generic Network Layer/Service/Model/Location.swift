//
//  Location.swift
//  Generic Network Layer
//
//  Created by Talha Batuhan Irmalı on 7.05.2023.
//

import Foundation


// MARK: - Locations
struct LocationModel: Decodable {
    var info: Info?
    var results: [Locations]?
}

// MARK: - Info
struct Info:Decodable {
    let count, pages: Int?
    let next: String?
    let prev: String?
}

// MARK: - Result
struct Locations:Decodable {
    let id: Int?
    let name, type, dimension: String?
    let residents: [String]?
    let url: String?
    let created: String?
}
