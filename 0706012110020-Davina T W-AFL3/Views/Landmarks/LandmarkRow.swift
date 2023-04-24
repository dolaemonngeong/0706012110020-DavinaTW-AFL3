//
//  LandmarkRow.swift
//  0706012110020-Davina T W-AFL3
//
//  Created by MacBook Pro on 14/04/23.
//

import SwiftUI

struct LandmarkRow: View {
    var landmark: Landmark
    
    var body: some View {
        HStack {
            landmark.image
                .resizable()
                .frame(width: 50, height: 50)
                .cornerRadius(5)
            
            
            VStack(alignment: .leading) {
                
                Text(landmark.name)
                    .bold()
                
                // jika bukan watchOS, maka tampilkan juga text nama park dari landmark
                #if !os(watchOS)
                    Text(landmark.park)
                        .font(.caption)
                        .foregroundColor(.secondary)
                #endif
                
            }
            
            Spacer()
            
            // jika terdapat sebuah data ditemukan terdapat landmark favorit, maka berikan bintang berwarna kuning
            if landmark.isFavorite {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }
        }
        
        // memberi jarak pada atas dan bawah
        .padding(.vertical, 4)
    }
}

struct LandmarkRow_Previews: PreviewProvider {
    
    
    static var landmarks = ModelData().landmarks
    
    static var previews: some View {
        //        menggabungkan 2 data dengan Group yang menjadi container untuk mengelompokkan view content
        Group {
            
            //            menampilkan data pertama
            LandmarkRow(landmark: landmarks[0])
            
            //        menampilkan data kedua
            LandmarkRow(landmark: landmarks[1])
        }
        
        //        mengatur ukuran view pada setiap list data
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
