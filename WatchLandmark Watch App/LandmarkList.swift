//
//  LandmarkList.swift
//  WatchLandmark Watch App
//
//  Created by MacBook Pro on 23/04/23.
//

import SwiftUI

struct LandmarkList: View {
    
    // property untuk membuat view yang bergantung pada data bersama
    @EnvironmentObject var modelData: ModelData
    
    // property yang simpan informasi landmark favorit
    @State private var showFavoritesOnly = false

    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }

    var body: some View {
        NavigationView {
            List {
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites only")
                }

                ForEach(filteredLandmarks) { landmark in
                    NavigationLink {
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
            .navigationTitle("Landmarks")
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
            .environmentObject(ModelData())
    }
}
