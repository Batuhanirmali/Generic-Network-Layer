//
//  Endpoint.swift
//  Generic Network Layer
//
//  Created by Talha Batuhan Irmalı on 7.05.2023.
//

import Foundation

protocol EndpointProtocol {
    var baseURL: String {get}
    var path: String {get}
    var method: HTTPMethod {get}
    var header: [String:String]? {get}
    
    func request() -> URLRequest
}

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case delete = "DELETE"
    case patch = "PATCH"
}

enum Endpoint: String {
    case getLocations
    case getChar
}

extension Endpoint: EndpointProtocol {
    var baseURL: String {
        return "https://rickandmortyapi.com"
    }
    
    var path: String {
        switch self {
            
        case .getLocations:
            return "/api/location"
        case .getChar:
            return "/api/character"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getLocations:
            return .get
        case .getChar:
            return .get
        }
    }
    
    var header: [String : String]? {
        return nil
    }
    
    func request() -> URLRequest {
        guard var components = URLComponents(string: baseURL) else {
            fatalError("Url Error")
        }
        components.path = path
        
        var request = URLRequest(url: components.url!)
        request.httpMethod = method.rawValue
        
        if let header = header {
            for (key, value) in header {
                request.setValue(value, forHTTPHeaderField: key)
            }
        }
        return request
    }
}

