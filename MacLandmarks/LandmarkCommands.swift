//
//  LandmarkCommands.swift
//  0706012110020-Davina T W-AFL3
//
//  Created by MacBook Pro on 23/04/23.
//

import SwiftUI

// struct LandmarkCommand yang menggunakan protokol Commands
struct LandmarkCommands: Commands {
    
    // deklarasi focused binding variabel yang memantau pilihan landmark yang dipilih pengguna
    @FocusedBinding(\.selectedLandmark) var selectedLandmark
    
    var body: some Commands {
        // commands yang digunakan untuk memanipulsikan window sidebar
        SidebarCommands()
        
        // memberi akses pengguna untuk memilih landmark tertentu yang dijadikan favorit
        CommandMenu("Landmark") {
            
            // memberi tombol yang dapat memperbarui status landmark favorite
            Button("\(selectedLandmark?.isFavorite == true ? "Remove" : "Mark") as Favorite") {
                selectedLandmark?.isFavorite.toggle()
            }
            
            // mengatur keyboard shortcut yakni shift + option + f untuk memperbarui landmark favorite
            .keyboardShortcut("f", modifiers: [.shift, .option])
            
            // pengaturan jika belum memilih & tidak menekan tombol/menggunakan shortcut di atas
            .disabled(selectedLandmark == nil)
        }
    }
}

//struct yang bersifat private dan menggunakan protocol FocusedValueKey
private struct SelectedLandmarkKey: FocusedValueKey {
    // fungtion yang memberi nama/alias ke Binding<Landmark>
    typealias Value = Binding<Landmark>
}

// extension yang menyediakan computed property selectedLandmark yang mengembailkan value berupa Binding<Landmark>
extension FocusedValues {
    var selectedLandmark: Binding<Landmark>? {
        // menerima value
        get { self[SelectedLandmarkKey.self] }
        
        // memperbarui value
        set { self[SelectedLandmarkKey.self] = newValue }
    }
}
