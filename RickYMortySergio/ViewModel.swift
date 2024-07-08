//
//  ViewModel.swift
//  RickYMortySergio
//
//  Created by Sergio Cobos on 26/4/24.
//

import Foundation

final class CharacterListViewModel: ObservableObject {
    
    let characterInteractor: CharacterInteractorProtocol
    
    @Published var characters: [RyMCharacterDTO] = []
    
    init(interactor: CharacterInteractorProtocol = CharacterInteractor.shared)  {
        self.characterInteractor = interactor
        Task {
            await getCharacters()
        }
    }
    
    func getCharacters() async {
        do {
            let characterResult = try await characterInteractor.fetchCharacters()
            await MainActor.run {
                self.characters = characterResult.results
            }
        } catch {
            print(error)
        }
    }
}
