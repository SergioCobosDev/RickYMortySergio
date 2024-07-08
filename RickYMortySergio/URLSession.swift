//
//  URLSession.swift
//  RickYMortySergio
//
//  Created by Sergio Cobos on 30/4/24.
//

import Foundation

extension URLSession {
    func getData(url: URL) async throws -> (data: Data, response: HTTPURLResponse) {
        
        let (data, response) = try await data(from: url)
        
        guard let responseHTTP = response as? HTTPURLResponse else {
            throw NetworkError.nonHTTP
        }
        
        return (data, responseHTTP)
    }
}
