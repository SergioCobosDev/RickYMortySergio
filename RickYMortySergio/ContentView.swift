//
//  ContentView.swift
//  RickYMortySergio
//
//  Created by Sergio Cobos on 25/4/24.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var vm = CharacterListViewModel()
    
    var body: some View {
        NavigationStack{
            Group {
                switch vm.viewStatus {
                case .loading:
                    ProgressView()
                        .controlSize(.extraLarge)
                case .loaded:
                    if vm.characters.isEmpty {
                        ContentUnavailableView("No existe", systemImage: "iphone", description: Text("No se existe \(vm.searchText)"))
                    }
                    List {
                        ForEach(vm.characters) { character in
                            NavigationLink(value: character){
                                CharacterCell(character: character)
                            }
                            .onAppear {
                                    Task {
                                        await vm.nextPageCharacters(id: character.id)
                                    }
                                }
                        }
                    }
                case .error:
                    
                    CustomAlertView(alertDescription: "Alerta", alertTittle: "Algo ha fallado") {
                        vm.viewStatus = .loaded
                    }
                }
            
            }
            .navigationTitle("Characters List")
            .navigationDestination(for: RyMCharacterDTO.self) { character in
                Text(character.name)
            }
            .searchable(text: $vm.searchText, prompt: "Search")
            .onChange(of: vm.searchText) { oldValue, newValue in
                Task {
                    try await Task.sleep(for: .seconds(1))
                    if newValue == vm.searchText {
                        await vm.getCharacters()
                    }
                }
                
                if newValue == "" {
                    vm.filter = .all
                    
                }
            }
            .toolbar{
                ToolbarItem(placement: .automatic) {
                    Picker("Hola", selection: $vm.filter) {
                        ForEach(Gender.allCases) { filter in
                            Text(filter.rawValue.capitalized)
                        }
                    }
                }
                
            }

        }
    }
}

#Preview {
    ContentView()
}
