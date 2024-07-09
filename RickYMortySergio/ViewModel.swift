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
    
    var page = 1
    
    init(interactor: CharacterInteractorProtocol = CharacterInteractor.shared)  {
        self.characterInteractor = interactor
        Task {
            await getCharacters()
        }
    }
    
    func getCharacters() async {
        do {
            let characterResult = try await characterInteractor.fetchCharacters(page: page)
            await MainActor.run {
                self.characters = characterResult.results
            }
        } catch {
            print(error)
        }
    }
    
    func nextPageCharacters(id: Int) async {
        if characters.last?.id == id {
            page += 1
            Task {
                await getCharacters()
            }
        }
    }
}
