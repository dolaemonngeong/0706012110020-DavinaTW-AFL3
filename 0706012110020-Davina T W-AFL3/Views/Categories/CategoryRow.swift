//
//  CategoryRow.swift
//  0706012110020-Davina T W-AFL3
//
//  Created by MacBook Pro on 18/04/23.
//

import SwiftUI

struct CategoryRow: View {
    var categoryName: String
    var items: [Landmark]
    
    var body: some View {
        
        //  kumpulan kelompok view secara vertikal ditaruh di kiri dan tengah
        VStack(alignment: .leading) {
            Text(categoryName)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)
            
            //  pengguna dapat scroll secara horisontal
            ScrollView(.horizontal, showsIndicators: false) {
                
                // data 'rivers' disusun secara horisontal dimana jarak antar tiap river/sungai adalah 0 dan ditaruh pada sisi atas VStack
                HStack(alignment: .top, spacing: 0) {
                    ForEach(items) { landmark in
                        NavigationLink {
                            LandmarkDetail(landmark: landmark)
                        } label: {
                            CategoryItem(landmark: landmark)
                        }
                    }
                }
            }
            
            // mengatur ukuran ketinggian baris dari tulisan nama kategori hingga tulisan nama river/sungai
            .frame(height: 185)
        }
    }
}

struct CategoryRow_Previews: PreviewProvider {
    static var landmarks = ModelData().landmarks
    
//    menampilkan kategori pada index pertama pada preview
    static var previews: some View {
        CategoryRow(
            categoryName: landmarks[0].category.rawValue,
            items: Array(landmarks.prefix(4))
        )
    }
}
