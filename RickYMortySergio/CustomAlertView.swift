//
//  CustomAlertView.swift
//  RickYMortySergio
//
//  Created by Sergio Cobos on 10/3/25.
//

import SwiftUI

struct CustomAlertView: View {
    let alertDescription: String
    let alertTittle: String
    let action: () -> Void
    
    var body: some View {
        VStack (alignment: .center, spacing: 10){
            Image(systemName: "exclamationmark.triangle.fill")
                .foregroundStyle(.yellow)
            Text(alertTittle)
                .font(.largeTitle)
            Text(alertDescription)
                .font(.body)
            Button(action: {
                action()
            }, label: {
                Text("Button")
            })
        }
    }
}

#Preview {
    CustomAlertView(alertDescription: "Descripcion", alertTittle: "Titulo", action: {})
}
