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
    
//    variabel yang memegang informasi wilayah dimana @State akan memberikan informasi antar view
    @State private var region = MKCoordinateRegion()
    	
    var body: some View {
        
//        mengambil binding untuk region
        Map(coordinateRegion: $region)
//        untuk memicu penghitungan wilayah berdasarkan koordinat saat ini.
            .onAppear{
                setRegion(coordinate)
            }
    }
    
//    metode yang dapat update wilayah berdasarkan nilai koordinat
    private func setRegion(_ coordinate: CLLocationCoordinate2D){
        region = MKCoordinateRegion(
            center: coordinate,
            span:  MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        )
    }
}


struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(coordinate: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868))
    }
}
