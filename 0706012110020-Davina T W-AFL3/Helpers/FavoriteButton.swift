//
//  FavoriteButton.swift
//  0706012110020-Davina T W-AFL3
//
//  Created by MacBook Pro on 14/04/23.
//

import SwiftUI

struct FavoriteButton: View {
    
    //    menunjukkan status tombol terbaru, dan memberikan nilai konstan untuk pratinjau
    @Binding var isSet: Bool
    
    var body: some View {
        
        //        menampilkan tombol bintang
        Button{
            isSet.toggle()
        } label: {
            Label("Toggle Favorite", systemImage: isSet ? "star.fill" : "star")
                .labelStyle(.iconOnly)
                .foregroundColor(isSet ? .yellow : .gray)
        }
    }
}

struct FavoriteButton_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteButton(isSet: .constant(true))
    }
}
