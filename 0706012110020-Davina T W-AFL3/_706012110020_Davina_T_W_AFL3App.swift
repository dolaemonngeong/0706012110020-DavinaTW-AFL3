//
//  _706012110020_Davina_T_W_AFL3App.swift
//  0706012110020-Davina T W-AFL3
//
//  Created by MacBook Pro on 11/04/23.
//

import SwiftUI

@main
struct _706012110020_Davina_T_W_AFL3App: App {
    
    //    inisialisasi observable object ModelData()
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
        
        // conditional jika operating system bukan watchOS, maka panggil struct LandmarkCommands() dengan
        #if !os(watchOS)
            // view modifier yang digunakan untuk menambahkan custom app-level actions ke toolbar
            .commands {
                LandmarkCommands()
            }
        #endif
        
        
        // sebuah conditional jika operating system adalah watchOS, maka tampilkan notifikasi watchOS dengan menggunakan class NotificationController dan  pemberian nama category
        #if os(watchOS)
            WKNotificationScene(controller: NotificationController.self, category: "LandmarkNear")
        #endif
        
        // sebuah conditional jika operating system adalah macOS, maka panggil struct LandmarkSettings() saat pengguna memilih "Settings"
        #if os(macOS)
            Settings {
                LandmarkSettings()
            }
        #endif
    }
}
