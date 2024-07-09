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
    static func get(url: URL, method: HTTPMethod = .get, page: Int) -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.url?.append(queryItems: [URLQueryItem(name: "page", value: "\(page)")])
        return request
    }
}
