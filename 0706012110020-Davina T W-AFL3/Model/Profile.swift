//
//  Profile.swift
//  0706012110020-Davina T W-AFL3
//
//  Created by MacBook Pro on 18/04/23.
//

import Foundation

struct Profile {
    var username: String
    var prefersNotifications = true
    var seasonalPhoto = Season.winter
    var goalDate = Date()
    
    // membuat pengguna baru dengan property username "g_kumar" secara default
    static let `default` = Profile(username: "g_kumar")
    
    // enum adalah tipe data yang memiliki kumpulan nilai tetap. pada bagian ini enum Season memiliki 3 protokol yakni String, CaseIterable, dan Identifiable
    enum Season: String, CaseIterable, Identifiable {
        // nilai yang didefinisikan dalam enum season berupa string
        case spring = "🌷"
        case summer = "🌞"
        case autumn = "🍂"
        case winter = "☃️"
        
        //  property yang diperlukan untuk menyesuaikan protokol Identifiable
        var id: String { rawValue }
    }
}
