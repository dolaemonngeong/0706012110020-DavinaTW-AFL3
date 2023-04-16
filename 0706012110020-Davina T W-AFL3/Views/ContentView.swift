//
//  ContentView.swift
//  0706012110020-Davina T W-AFL3
//
//  Created by MacBook Pro on 11/04/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LandmarkList()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
//        membuat objek tersedia untuk semua view
            .environmentObject(ModelData())
    }
}
