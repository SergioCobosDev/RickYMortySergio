//
//  CharacterCell.swift
//  RickYMortySergio
//
//  Created by Sergio Cobos on 10/3/25.
//

import SwiftUI

struct CharacterCell: View {
    let character: RyMCharacterDTO
    var body: some View {
        HStack(alignment: .center){
            AsyncImage(url: character.image) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .clipShape(.rect(cornerRadius: 20))
                    .frame(width: 100)
                    .padding()
            } placeholder: {
                ProgressView()
            }
            VStack(alignment: .leading) {
                Text(character.name)
                
                Text("\(character.id)")
            }
        }
    }
}

#Preview {
    CharacterCell(character: .previewCharacter )
}
