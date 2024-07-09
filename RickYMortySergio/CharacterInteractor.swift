//
//  CharacterInteractor.swift
//  RickYMortySergio
//
//  Created by Sergio Cobos on 25/4/24.
//

import Foundation

protocol CharacterInteractorProtocol {
    func fetchCharacters(page: Int) async throws -> CharacterResponseDTO
}

struct CharacterInteractor: CharacterInteractorProtocol, NetworkInteractor {
    
    var session: URLSession
    
    static let shared = CharacterInteractor()
    
    private init(session: URLSession = .shared) {
        self.session = session
    }
    
    func fetchCharacters(page: Int) async throws -> CharacterResponseDTO {
        try await getJSONFromURL(request: .get(url: .getCharacterURL, page: page), type: CharacterResponseDTO.self)
    }
    
//    func fetchCharacters() async throws -> CharacterResponseDTO {
//        let(data, response) = try await URLSession.shared.data(from: .getCharacterURL)
//        
//        guard let responseHTTP = response as? HTTPURLResponse else {
//            throw NetworkError.nonHTTP
//        }
//        
//        if responseHTTP.statusCode == 200 {
//            print("llamada de red")
//            return try JSONDecoder().decode(CharacterResponseDTO.self, from: data)
//        } else {
//            throw NetworkError.badStatusCode(responseHTTP.statusCode)
//        }
//    }
}

