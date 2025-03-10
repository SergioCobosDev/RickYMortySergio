//
//  URLSession.swift
//  RickYMortySergio
//
//  Created by Sergio Cobos on 30/4/24.
//

import Foundation

enum HTTPMethod: String {
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
    case patch = "PATCH"
    case get = "GET"
}

extension URLRequest {
    static func get(url: URL, method: HTTPMethod = .get, page: Int, name: String, gender: String) -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.url?.append(queryItems: [.page(page), .name(name), .gender(gender)] )
        print(request)
        return request
    }
}

extension URLQueryItem {
    static func page(_ page: Int) -> URLQueryItem {
        URLQueryItem(name: "page", value: "\(page)")
    }
    
    static func name(_ name: String) -> URLQueryItem {
        URLQueryItem(name: "name", value: name)
    }
    
    static func gender(_ gender: String) -> URLQueryItem {
        URLQueryItem(name: "gender", value: gender)
    }
}
