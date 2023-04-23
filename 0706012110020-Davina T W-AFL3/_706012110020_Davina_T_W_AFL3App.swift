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
        
        // sebuah conditional yang akan menampilkan notifikasi watchOS dengan menggunakan class NotificationController dan  pemberian nama category
        #if os(watchOS)
            WKNotificationScene(controller: NotificationController.self, category: "LandmarkNear")
        #endif
    }
}
