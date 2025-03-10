//
//  ViewModel.swift
//  RickYMortySergio
//
//  Created by Sergio Cobos on 26/4/24.
//

import Foundation

enum CharacterListViewStatus {
    case loading
    case loaded
    case error
}

final class CharacterListViewModel: ObservableObject {
    
    let characterInteractor: CharacterInteractorProtocol
    @Published var characters: [RyMCharacterDTO] = []
    var page = 1
    var isLastPage = false
    
    @Published var viewStatus: CharacterListViewStatus = .loading
    
    @Published var filter: Gender = .all {
        didSet {
            characters.removeAll()
            page = 1
            Task {
                await getCharacters()
            }
        }
    }
    @Published var searchText = "" {
        didSet {
            page = 1
            //characters.removeAll()
        }
    }
    
    init(interactor: CharacterInteractorProtocol = CharacterInteractor.shared)  {
        self.characterInteractor = interactor
        Task {
            await getCharacters()
        }
    }
    
    func getCharacters() async {
        await MainActor.run {
            viewStatus = .loading
            if page == 1 {
                characters.removeAll()
            }
        }
        do {
            let characterResult = try await characterInteractor.fetchCharacters(page: page, name: searchText, gender: filter == .all ? "" : filter.rawValue)
            await MainActor.run {
                self.characters += characterResult.results
                isLastPage = characterResult.info.next == nil
                viewStatus = .loaded
            }
        } catch {
            print(error)
            await MainActor.run {
                if searchText.isEmpty {
                    viewStatus = .error
                } else {
                    viewStatus = .loaded
                }
            }
        }
    }
    
    func nextPageCharacters(id: Int) async {
        if characters.last?.id == id && !isLastPage {
            page += 1
            Task {
                await getCharacters()
            }
        }
    }
}
