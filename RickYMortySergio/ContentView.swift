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
        List {
            ForEach(vm.characters) { character in
                Text(character.name)
            }
        }
    }
}

#Preview {
    ContentView(vm: .previewVM)
}
