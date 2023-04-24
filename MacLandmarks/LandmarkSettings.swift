//
//  LandmarkSettings.swift
//  0706012110020-Davina T W-AFL3
//
//  Created by MacBook Pro on 23/04/23.
//

import SwiftUI

struct LandmarkSettings: View {
    
    // property wrapper yang membaca & menulis value ke penyimpanan yang kuat
    @AppStorage("MapView.zoom")
    
    // deklarasi variabel secara default value yang dipilih ialah  medium
    private var zoom: MapView.Zoom = .medium
    
    var body: some View {
        
        // filter zoom in maupun zoom out dalam bentuk form yang berisi 3 pilihan
        Form {
            Picker("Map Zoom:", selection: $zoom) {
                
                // menampilkan pilihan enum Zoom yang berada di struct MapView
                ForEach(MapView.Zoom.allCases) { level in
                    Text(level.rawValue)
                }
            }
            
            // style menampilkan pilihan berupa inline
            .pickerStyle(.inline)
        }
        // memberi ukuran lebar frame form yakni 300
        .frame(width: 300)
        
        // memberi judul navigasi
        .navigationTitle("Landmark Settings")
        
        // memberi jarak sekitar form 80
        .padding(80)
    }
}

struct LandmarkSettings_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkSettings()
    }
}
