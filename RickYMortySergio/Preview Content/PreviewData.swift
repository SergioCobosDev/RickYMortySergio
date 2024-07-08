//
//  PreviewData.swift
//  RickYMortySergio
//
//  Created by Sergio Cobos on 26/4/24.
//

import Foundation

struct TestCharacterInteractor: CharacterInteractorProtocol {
    func fetchCharacters() async throws -> CharacterResponseDTO {
        let url = Bundle.main.url(forResource: "RickyMorty", withExtension: "json")!
        let data = try Data(contentsOf: url)
        return try JSONDecoder().decode(CharacterResponseDTO.self, from: data)
    }
}

extension CharacterListViewModel {
    static let previewVM = CharacterListViewModel(interactor: TestCharacterInteractor())
}
