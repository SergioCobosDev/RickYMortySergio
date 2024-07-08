//
//  NetworkError.swift
//  RickYMortySergio
//
//  Created by Sergio Cobos on 26/4/24.
//

import Foundation

enum NetworkError: LocalizedError {
    case nonHTTP
    case badStatusCode(Int)
    case decodingError(Error)
    var errorDescription: String {
        switch self {
            case .nonHTTP:
                "No es una conexión HTTP"
            case .badStatusCode(let statusCode):
                "Error de Status \(statusCode)"
            case .decodingError(let jsonError):
                "Error \(jsonError)"
        }
    }
}
