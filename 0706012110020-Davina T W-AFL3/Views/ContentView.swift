//
//  ContentView.swift
//  0706012110020-Davina T W-AFL3
//
//  Created by MacBook Pro on 11/04/23.
//

import SwiftUI

struct ContentView: View {
    //  variabel dengan value ".feautured" yang membantu dalam menampilkan tampilan default
    @State private var selection: Tab = .featured
    
    // inisialisasi variabel untuk bottom naviagation bar
    enum Tab {
        case featured
        case list
    }
    
    
    var body: some View {
        // memberi bottom navigation bar
        TabView(selection: $selection) {
            
            // memanggil struct CategoryHome
            CategoryHome()
            
            // menampilkan icon bintang pada bottom navigation bar
                .tabItem {
                    Label("Featured", systemImage: "star")
                }
            //  menampilkan struct CategoryHome secara deafult
                .tag(Tab.featured)
            
            // memanggil struct LandmarkList
            LandmarkList()
            
            // menampilkan icon list pada bottom navigation bar
                .tabItem {
                    Label("List", systemImage: "list.bullet")
                }
            
            // menampilkan struct LandmarkList saat pengguna menekan tombol "List" di bottom navigation bar
                .tag(Tab.list)
        }
    }
}

// menampilkan preview untuk debugging, testing, dan design
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
        // membuat objek tersedia untuk semua view
            .environmentObject(ModelData())
    }
}
