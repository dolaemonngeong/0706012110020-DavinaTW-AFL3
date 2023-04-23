//
//  LandmarkDetail.swift
//  WatchLandmark Watch App
//
//  Created by MacBook Pro on 22/04/23.
//

import SwiftUI

// struct LandmarkDetail yang berbeda dengan LandmarkDetail yang berada di folder Landmarks
struct LandmarkDetail: View {
    @EnvironmentObject var modelData: ModelData
    var landmark: Landmark
    
    var landmarkIndex: Int {
        modelData.landmarks.firstIndex(where: { $0.id == landmark.id })!
    }
    
    var body: some View {
        ScrollView {
            VStack {
                
                // memanggil struct CircleImage
                CircleImage(image: landmark.image.resizable())
                    .scaledToFit()
                
                Text(landmark.name)
                    .font(.headline)
                
                // jumlah baris text maksimal ialah 0
                    .lineLimit(0)
                
                // tombol toggle yang secara default dapat menyala jika atribut "isFavorite" dalam struct Landmark adalah true
                Toggle(isOn: $modelData.landmarks[landmarkIndex].isFavorite) {
                    Text("Favorite")
                }
                
                // garis tipis berwarna abu-abu
                Divider()
                
                Text(landmark.park)
                    .font(.caption)
                    .bold()
                
                // jumlah baris text maksimal ialah 0
                    .lineLimit(0)
                
                Text(landmark.state)
                    .font(.caption)
                
                Divider()
                
                // memanggil struct MapView
                MapView(coordinate: landmark.locationCoordinate)
                    .scaledToFit()
            }
            // memberi jarak di sekitar VStack
            .padding(16)
        }
        .navigationTitle("Landmarks")
    }
    
}

struct LandmarkDetail_Previews: PreviewProvider {
    static var previews: some View {
        
        // deklarasi untuk membantu dalam menggunakan array landmarks
        let modelData = ModelData()
        
        return Group {
            
            // memanggil struct LandmarkDetail dengan menggunakan data dari array landmarks index "0" dan menggunakan device Apple Watch Series 5 - 44mm
            LandmarkDetail(landmark: modelData.landmarks[0])
                .environmentObject(modelData)
                .previewDevice("Apple Watch Series 5 - 44mm")
            
            // memanggil struct LandmarkDetail dengan menggunakan data dari array landmarks index "1" dan menggunakan device Apple Watch Series 5 - 40mm
            LandmarkDetail(landmark: modelData.landmarks[1])
                .environmentObject(modelData)
                .previewDevice("Apple Watch Series 5 - 40mm")
        }
    }
}
