//
//  ProfileSummary.swift
//  0706012110020-Davina T W-AFL3
//
//  Created by MacBook Pro on 18/04/23.
//

import SwiftUI

struct ProfileSummary: View {
    
    // inisialisasi variabel modelData untuk mempermudah dalam mengakses class ModelData
    @EnvironmentObject var modelData: ModelData
    
    // inisialisasi variabel profile untuk mempermudah dalam mengakses struct Profile
    var profile: Profile
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                Text(profile.username)
                    .bold()
                    .font(.title)
                
                Text("Notifications: \(profile.prefersNotifications ? "On": "Off" )")
                Text("Seasonal Photos: \(profile.seasonalPhoto.rawValue)")
                Text("Goal Date: ") + Text(profile.goalDate, style: .date)
                
                // memberi garis tipis berwarna abu-abu untuk memisahkan konten
                Divider()
                
                VStack(alignment: .leading) {
                    Text("Completed Badges")
                        .font(.headline)
                    
                    ScrollView(.horizontal) {
                        HStack {
                            // memanggil struct HikeBadge dengan property nama "First Hike
                            HikeBadge(name: "First Hike")
                            
                            // memanggil struct HikeBadge dengan property nama "Earth Day"
                            HikeBadge(name: "Earth Day")
                            
                            //  menyesuaikan hue yang diputar 90 derajat dimana warna dasarnya berubah menjadi hijau
                                .hueRotation(Angle(degrees: 90))
                            
                            //                            memanggil struct HikeBadge dengan property nama "Teeth Hike"
                            HikeBadge(name: "Tenth Hike")
                            
                            // mengubah saturasi warna menjadi abu-abu dengan value 0.5
                                .grayscale(0.5)
                            
                                .hueRotation(Angle(degrees: 45))
                        }
                        
                        // memberi jarak di bawah HStack
                        .padding(.bottom)
                    }
                }
                
                Divider()
                
                VStack(alignment: .leading) {
                    Text("Recent Hikes")
                        .font(.headline)
                    
                    // memanggil struct HikeView yang menampilkan array hikes pada index 0
                    HikeView(hike: modelData.hikes[0])
                }
            }
        }
    }
}

struct ProfileSummary_Previews: PreviewProvider {
    static var previews: some View {
        
        // memanggil struct ProfileSummary dengan property profile
        ProfileSummary(profile: Profile.default)
            .environmentObject(ModelData())
    }
}
