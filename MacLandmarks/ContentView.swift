//
//  ContentView.swift
//  MacLandmarks
//
//  Created by MacBook Pro on 23/04/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        // memanggil struct LandmarkList yang berada di folder Landmarks. Tampilannya 
        LandmarkList()
            .frame(minWidth: 700, minHeight: 300)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
