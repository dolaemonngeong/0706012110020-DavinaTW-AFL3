//
//  LandmarkList.swift
//  0706012110020-Davina T W-AFL3
//
//  Created by MacBook Pro on 14/04/23.
//

import SwiftUI

struct LandmarkList: View {
    
    //    property untuk membuat view yang bergantung pada data bersama
    @EnvironmentObject var modelData: ModelData
    
    //    property yang simpan informasi spesifik
    @State private var showFavoritesOnly = false
    
    //    variabel yang membantu dalam menampilkan landmark favorit
    var filteredLandmarks: [Landmark]{
        modelData.landmarks.filter{ landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }
    
    var body: some View {
        //  menampilkan tumpukan tampilan yang mewakili jalur yang terlihat dalam hierarki navigasi
        NavigationView {
            
            // menampilkan seluruh list data
            List {
                
                //  memberi tombol toggle yang dapat filter landmark favorit
                Toggle(isOn: $showFavoritesOnly){
                    Text("Favorites only")
                }
                
                //  navigasi ke detail dari landmark yang diklik pengguna
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink{
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
            
            //            menampilkan judul pada navigation bar
            .navigationTitle("Landmarks")
        }
        
        //        NavigationStack{
        //            List(landmarks){ landmark in
        //                NavigationLink{
        //                    LandmarkDetail(landmark: landmark)
        //                }
        //            }
        //        }
        
    }
}

struct LandmarkList_Previews: PreviewProvider {
    
    //    di dalam variabel bawah ini dapat custom device pada preview
    static var previews: some View {
        LandmarkList().environmentObject(ModelData())
    }
}
