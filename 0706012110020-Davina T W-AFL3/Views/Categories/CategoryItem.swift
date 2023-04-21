//
//  CategoryItem.swift
//  0706012110020-Davina T W-AFL3
//
//  Created by MacBook Pro on 18/04/23.
//

import SwiftUI

struct CategoryItem: View {
    var landmark: Landmark
    
    var body: some View {
        
//        mengatur posisi VStack pada posisi kiri tengah
        VStack(alignment: .leading) {
            landmark.image
            
            // mengatur rendering mode menjadi "original" atau tanpa efek yang berguna jika gambar yang ditampilkan sudah memiliki efek (blur atau berwarna hitam putih (grayscale))
                .renderingMode(.original)
            
                .resizable()
                .frame(width: 155, height: 155)
            
            // memberi lengkungan pada titik sudut dengan 5 pixel
                .cornerRadius(5)
            
            Text(landmark.name)
                .foregroundColor(.primary)
                .font(.caption)
        }
        
        // memberi padding pada sisi kiri VStack
        .padding(.leading, 15)
    }
}

struct CategoryItem_Previews: PreviewProvider {
    static var previews: some View {
        CategoryItem(landmark: ModelData().landmarks[0])
    }
}
