//
//  MapView.swift
//  0706012110020-Davina T W-AFL3
//
//  Created by MacBook Pro on 11/04/23.
//

import SwiftUI

//import sebuah framework
import MapKit

struct MapView: View {
    
    //    parameter pada MapView
    var coordinate: CLLocationCoordinate2D
    
//    //    variabel yang memegang informasi wilayah dimana @State akan memberikan informasi antar view
//    @State private var region = MKCoordinateRegion()
    
    // property wrapper yang membaca & menulis value ke penyimpanan yang kuat
    @AppStorage("MapView.zoom")
    
    // deklarasi variabel yang secara default memasang longitude dan latitude pada medium
    private var zoom: Zoom = .medium
    
    // enumeration yang menggunakan protokol Identifiable dengan 3 case dan memiliki property id yang mengembalikan value dirinya sendiri yang merupakan instance dari enumeration
    enum Zoom: String, CaseIterable, Identifiable {
        case near = "Near"
        case medium = "Medium"
        case far = "Far"
        
        var id: Zoom {
            return self
        }
    }
    
    // mengatur longitude & latitude yang akan digunakan property region
    var delta: CLLocationDegrees {
        switch zoom {
        case .near: return 0.02
        case .medium: return 0.2
        case .far: return 2
        }
    }
    
    var body: some View {
        
        //        //        mengambil binding untuk region
        //        Map(coordinateRegion: $region)
        //        //        untuk memicu penghitungan wilayah berdasarkan koordinat saat ini.
        //            .onAppear{
        //                setRegion(coordinate)
        //            }
        Map(coordinateRegion: .constant(region))
    }
    
    //    //    metode yang dapat update wilayah berdasarkan nilai koordinat
    //    private func setRegion(_ coordinate: CLLocationCoordinate2D){
    //        region = MKCoordinateRegion(
    //            center: coordinate,
    //            span: MKCoordinateSpan(latitudeDelta: delta, longitudeDelta: delta)
    //        )
    //    }
    
    // variabel region yang sudah menentukan nilai koordinatnya
    var region: MKCoordinateRegion {
        MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: delta, longitudeDelta: delta)
        )
    }
    
}


struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(coordinate: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868))
    }
}
