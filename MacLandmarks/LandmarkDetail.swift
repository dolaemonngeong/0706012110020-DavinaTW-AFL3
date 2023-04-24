//
//  LandmarkDetail.swift
//  MacLandmarks
//
//  Created by MacBook Pro on 23/04/23.
//

import SwiftUI
import MapKit

struct LandmarkDetail: View {
    // deklarasi modelData sebagai environtment objek yang dapat diakses view dan subview
    @EnvironmentObject var modelData: ModelData
    
    var landmark: Landmark
    
    var landmarkIndex: Int {
        modelData.landmarks.firstIndex(where: { $0.id == landmark.id })!
    }
    
    var body: some View {
        ScrollView {
            
            // kumpulan view yang melapisi satu sama lain dimana masing-masing view ditaruh di kanan secara horisontal dan di atas secara vertikal
            ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)) {
                
                // memanggil struct MapView untuk menampilkan peta
                MapView(coordinate: landmark.locationCoordinate)
                    .ignoresSafeArea(edges: .top)
                    .frame(height: 300)
                
                // tombol "Open in Maps" yang terletak di kanan atas untuk navigasi ke Maps yang menampilkan letak lokasinya secara detail
                Button("Open in Maps") {
                    let destination = MKMapItem(placemark: MKPlacemark(coordinate: landmark.locationCoordinate))
                    destination.name = landmark.name
                    destination.openInMaps()
                }
                
                // memberi jarak di sekitar tombol
                .padding()
            }
            
            // kumpulan kelompok view secara vertikal yang diberi spasi sebesar 20 dan menggunakan alignment rata kiri
            VStack(alignment: .leading, spacing: 20) {
                
                // kumpulan kelompok view secara horisontal yang diberi spasi sebesar 24
                HStack(spacing: 24) {
                    
                    // memanggil struct CircleImage untuk menampilkan gambarnya
                    CircleImage(image: landmark.image.resizable())
                        .frame(width: 160, height: 160)
                    
                    // kumpulan kelompok view secara vertikal yang menggunakan alignment rata kiri
                    VStack(alignment: .leading) {
                        HStack {
                            
                            Text(landmark.name)
                                .font(.title)
                            
                            // memberikan tombol bintang
                            FavoriteButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite)
                                .buttonStyle(.plain)
                        }
                        
                        VStack(alignment: .leading) {
                            Text(landmark.park)
                            Text(landmark.state)
                        }
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    }
                }
                
                // memberi garis tipis berwarna abu-abu
                Divider()
                
                Text("About \(landmark.name)")
                    .font(.title2)
                Text(landmark.description)
            }
            
            // memberi jarak pada VStack
            .padding()
            
            // memberi lebar maksmal pada VStack
            .frame(maxWidth: 700)
            
            // mengatur posisi vertikal pada VStack
            .offset(y: -50)
        }
        
        // memberi judul navigasi dengan nama landmark
        .navigationTitle(landmark.name)
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        LandmarkDetail(landmark: modelData.landmarks[0])
            .environmentObject(modelData)
        
        // memberi ukuran frame pada preview
            .frame(width: 850, height: 700)
    }
}
