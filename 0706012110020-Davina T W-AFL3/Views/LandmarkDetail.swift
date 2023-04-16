//
//  LandmarkDetail.swift
//  0706012110020-Davina T W-AFL3
//
//  Created by MacBook Pro on 14/04/23.
//

import SwiftUI

struct LandmarkDetail: View {
    @EnvironmentObject var modelData: ModelData
    
//    property LandmarkDetail
    var landmark: Landmark
    
    var landmarkIndex: Int {
        modelData.landmarks.firstIndex(where: {$0.id == landmark.id })!
    }
    
    var body: some View {
        
//        pengguna dapat scroll
        ScrollView {
            
//            memanggil struct MapView untuk mensmpilkan peta
            MapView(coordinate: landmark.locationCoordinate)
            
//            menaruh ukuran peta di paling atas
                .ignoresSafeArea(edges: .top)
            
//            memberi ukuran frame peta dengan ketinggian 300
                .frame(height: 300)

//            memanggil struct CircleImage untuk menampilkan gambarnya
            CircleImage(image: landmark.image)
            
//            mengatur posisi gambar di tengah
                .offset(y: -130)
                .padding(.bottom, -130)
            
//          kumpulan kelompok view secara vertikal yang di dalamnya memiliki beberapa kelompok view secara horisontal
            VStack(alignment: .leading) {
                
//                kumpulan kelompok view secara horisontal
                HStack {
                    
//                    memberikan text dengan font title
                    Text(landmark.name)
                        .font(.title)
                    
//
                    FavoriteButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite)
                }

//                kumpulan kelompok view secara horisontal
                HStack {
                    
//                    memberikan text
                    Text(landmark.park)
                    
//                    memberikan jarak antara park dan state
                    Spacer()
                    
                    Text(landmark.state)
                }
//                memberi font tulisan HStack yang di atas
                .font(.subheadline)
//                memberi warna tulisan HStack yang di atas
                .foregroundColor(.secondary)

//                memberikan jarak secara vertikal
                Divider()
                
//              memberikan text dengan font khusus
                Text("About \(landmark.name)")
                    .font(.title2)
                Text(landmark.description)
            }
//            memberi jarak pada ujung kiri dan kanan
            .padding()
        }
        
//        pemberian judul navigasi
        .navigationTitle(landmark.name)
        
//        judul navigasi muncul secara inline
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        LandmarkDetail(landmark: landmarks[0])
            .environmentObject(modelData)
    }
}
