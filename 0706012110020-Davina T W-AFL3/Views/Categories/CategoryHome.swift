//
//  CategoryHome.swift
//  0706012110020-Davina T W-AFL3
//
//  Created by MacBook Pro on 18/04/23.
//

import SwiftUI

struct CategoryHome: View {
    @EnvironmentObject var modelData: ModelData
    
    //    digunakan untuk mengontrol presentasi dari profile user
    @State private var showingProfile = false
    
    var body: some View {
        NavigationView {
            List {
                
                //                // menampilkan gambar dari array deatures pada index pertama
                //                modelData.features[0].image
                //                // agar gambar menyesuaikan ukuran fram
                //                    .resizable()
                //
                //                //  gambar mengisi seluruh frame, walaupun ada sebagian yang dipotong/crop
                //                    .scaledToFill()
                //                // mengatur ketinggian frame
                //                    .frame(height: 200)
                //
                //                // memotong bagian gambar yang melebihi bingkai/frame
                //                    .clipped()
                //
                //                //  menghilangkan padding di sekitar gambar
                //                    .listRowInsets(EdgeInsets())
                
                // memanggil struct PageView
                PageView(pages: modelData.features.map { FeatureCard(landmark: $0) })
                    .aspectRatio(3 / 2, contentMode: .fit)
                    .listRowInsets(EdgeInsets())
                
                //  menampilkan seluruh data berdasarkan kategori dengan loop yang diambil dari struct CategoryRow
                ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
                    CategoryRow(categoryName: key, items: modelData.categories[key]!)
                    
                }
                .listRowInsets(EdgeInsets())
            }
            
            // mengatur gaya daftar (List) dengan margin atau padding di dalamnya
            .listStyle(.inset)
            
            // menampilkan judul navigasi yang terletak di bawah toolbar
            .navigationTitle("Featured")
            
            // memberi toolbar di paling atas
            .toolbar {
                
                //  memberi tombol oada bagain kanan atas untuk menampilkan profile
                Button {
                    showingProfile.toggle()
                } label: {
                    Label("User Profile", systemImage: "person.crop.circle")
                }
                
            }
            
            // menampilkan tampilan profile pengguna yang diambil dari struct ProfileHost ketika variabel showingProfile bernilai true
            .sheet(isPresented: $showingProfile) {
                ProfileHost()
                    .environmentObject(modelData)
            }
        }
    }
}

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome()
            .environmentObject(ModelData())
    }
}
