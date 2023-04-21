//
//  ProfileEditor.swift
//  0706012110020-Davina T W-AFL3
//
//  Created by MacBook Pro on 18/04/23.
//

import SwiftUI

struct ProfileEditor: View {
    @Binding var profile: Profile
    
    //    inisialisasi variabel yang mengembalikan value rentang tanggal yang mencakup satu tahun sebelum dan satu tahun setelah properti goalDate dari model Profile
    var dateRange: ClosedRange<Date> {
        let min = Calendar.current.date(byAdding: .year, value: -1, to: profile.goalDate)!
        let max = Calendar.current.date(byAdding: .year, value: 1, to: profile.goalDate)!
        return min...max
    }
    
    var body: some View {
        List {
            HStack {
                Text("Username").bold()
                Divider()
                
                // input pengguna berupa text
                TextField("Username", text: $profile.username)
            }
            
            // memberi tombol toggle untuk menentukan notifikasinya dapat nyala atau tidak
            Toggle(isOn: $profile.prefersNotifications) {
                Text("Enable Notifications").bold()
            }
            
            VStack(alignment: .leading, spacing: 20) {
                Text("Seasonal Photo").bold()
                
                // input pengguna berupa opsi season dari model Profile
                Picker("Seasonal Photo", selection: $profile.seasonalPhoto) {
                    ForEach(Profile.Season.allCases) { season in
                        Text(season.rawValue).tag(season)
                    }
                }
                
                // picker style yang menampilkan opsi secara horisontal yang dapat scroll juga (horizontally-scrollable segmented control)
                .pickerStyle(.segmented)
            }
            
            // input pengguna berupa pemilihan tanggal
            DatePicker(selection: $profile.goalDate, in: dateRange, displayedComponents: .date) {
                Text("Goal Date").bold()
            }
        }
    }
}

struct ProfileEditor_Previews: PreviewProvider {
    static var previews: some View {
        
        // memanggil struct ProfileEditor dengan property profile
        ProfileEditor(profile: .constant(.default))
    }
}
