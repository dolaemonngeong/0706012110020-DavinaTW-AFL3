//
//  Landmark.swift
//  0706012110020-Davina T W-AFL3
//
//  Created by MacBook Pro on 14/04/23.
//

import Foundation

//digunakan untuk property image
import SwiftUI

//digunakan untuk locationCoordinate
import CoreLocation

//inisialisasi Landmark dengan property yang menyesuaikan dengan file landmarkData.json yang berada di folder Resources. struct ini harus memenuhi protocol Hashable, Codable, dan Indentifable
struct Landmark: Hashable, Codable, Identifiable  {
    var id: Int
    var name: String
    var park: String
    var state: String
    var description: String
    var isFavorite: Bool
    
    private var imageName: String
       var image: Image {
           Image(imageName)
       }
    

    private var coordinates: Coordinates
    
//    untuk interaksi dengan MapKit framework
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }
    
//    sebuah nested struct yang mencerminkan penyimpanan dalam struktur data JSON
    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }
}

