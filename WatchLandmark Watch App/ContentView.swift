//
//  ContentView.swift
//  WatchLandmark Watch App
//
//  Created by MacBook Pro on 22/04/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        // memanggil struct LandmarkList() yang berada di folder Landmarks
        LandmarkList()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
