//
//  ProfileHost.swift
//  0706012110020-Davina T W-AFL3
//
//  Created by MacBook Pro on 18/04/23.
//

import SwiftUI

struct ProfileHost: View {
    // property wrapper yang digunakan agar dapat mengakses value editMode yang diatur di environment dalam SwiftUI View
    @Environment(\.editMode) var editMode
    
    @EnvironmentObject var modelData: ModelData
    
    // state property yang digunakan untuk mengendalikan perubahan/update data pada profile
    @State private var draftProfile = Profile.default
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                
                // mengecek jika view dalam editing mode aktif, maka munculkan tombol "cancel" dengan menampilkan juga data profile yang dapat diubah dan ubahlah editing mode menjadi inactive
                if editMode?.wrappedValue == .active {
                    Button("Cancel", role: .cancel) {
                        draftProfile = modelData.profile
                        editMode?.animation().wrappedValue = .inactive
                    }
                }
                
                // membuat jarak agar tombol EditButton terletak di pojok kanan
                Spacer()
                
                // memberi tombol yang bernama "Edit"
                EditButton()
            }
            
            // mengecek jika view dalam editing mode tidak aktif, maka panggil struct ProfileSummarty. Jika tidak, maka panggil struct ProfileEditor
            if editMode?.wrappedValue == .inactive {
                ProfileSummary(profile: modelData.profile)
            } else {
                ProfileEditor(profile: $draftProfile)
                
                // inisialisasi data profile saat sebuah view muncul
                    .onAppear {
                        draftProfile = modelData.profile
                    }
                
                // modifier yang simpan apapun perubahan data profile
                    .onDisappear {
                        modelData.profile = draftProfile
                    }
            }
        }
        .padding()
    }
}

struct ProfileHost_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHost()
            .environmentObject(ModelData())
    }
}
