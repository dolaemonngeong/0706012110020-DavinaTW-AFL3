//
//  ModelData.swift
//  0706012110020-Davina T W-AFL3
//
//  Created by MacBook Pro on 14/04/23.
//

import Foundation
import Combine

//
final class ModelData: ObservableObject{
    
    //    property wrappers untuk membuat objek yang dapat diamati secara otomatis mengumumkan saat terjadi perubahan
    @Published var landmarks: [Landmark] = load("landmarkData.json")
    
    //    inisialisasi variabel yang diambil dari file hikeData.json
    var hikes: [Hike] = load("hikeData.json")
    
    // setiap perubahan yang dibuat pada properti ini akan dipublikasikan ke tampilan
    @Published var profile = Profile.default
    
    //    array yang menyimpan data landmark dengan variabel boolean 'isFeatured' adalah true
    var features: [Landmark] {
        landmarks.filter { $0.isFeatured }
    }
    
    //    inisialisasi variabel dengan tipe data dictionary yang bernama 'categories'
    var categories: [String: [Landmark]] {
        Dictionary(
            grouping: landmarks,
            by: { $0.category.rawValue }
        )
    }
}

//array yang diinisialisasi dari landmarkData.json
//var landmarks: [Landmark] = load("landmarkData.json")

//method yang mengambil JSON data
func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
