//
//  LandmarkList.swift
//  0706012110020-Davina T W-AFL3
//
//  Created by MacBook Pro on 14/04/23.
//

import SwiftUI

struct LandmarkList: View {
    
    // property untuk membuat view yang bergantung pada data bersama
    @EnvironmentObject var modelData: ModelData
    
    // property yang simpan informasi dimana secara default tidak menampilkan landmark favorit
    @State private var showFavoritesOnly = false
    
    @State private var filter = FilterCategory.all
    
    @State private var selectedLandmark: Landmark?
    
    // enumeration yang membantu dalam menampilkan pilihan pada bagian filter
    enum FilterCategory: String, CaseIterable, Identifiable {
        case all = "All"
        case lakes = "Lakes"
        case rivers = "Rivers"
        case mountains = "Mountains"
        
        var id: FilterCategory { self }
    }
    
    
    // variabel yang membantu dalam filter data landmark
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
            && (filter == .all || filter.rawValue == landmark.category.rawValue)
        }
    }
    
    var title: String {
        let title = filter == .all ? "Landmarks" : filter.rawValue
        return showFavoritesOnly ? "Favorite \(title)" : title
    }
    
    // variabel untuk menunjukkan index pilihan landmark
    var index: Int? {
        modelData.landmarks.firstIndex(where: { $0.id == selectedLandmark?.id })
    }
    
    var body: some View {
        //  menampilkan tumpukan tampilan yang mewakili jalur yang terlihat dalam hierarki navigasi
        NavigationView {
            
            // menampilkan seluruh list data
            List(selection: $selectedLandmark){
                
                //  memberi tombol toggle yang dapat filter landmark favorit
                //                Toggle(isOn: $showFavoritesOnly){
                //                    Text("Favorites only")
                //                }
                
                //  navigasi ke detail dari landmark yang diklik pengguna
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink{
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                    
                    // mempermudah pengambilan landmark yang dipilih
                    .tag(landmark)
                }
            }
            
            // menampilkan judul pada navigation bar
            .navigationTitle(title)
            
            // mengatur minimum lebar frame
            .frame(minWidth: 300)
            
            // memberi toolbar yang filter dengan pemilihan kategori dan tombol checkbox favorit
            .toolbar {
                ToolbarItem {
                    
                    Menu {
                        Picker("Category", selection: $filter) {
                            ForEach(FilterCategory.allCases) { category in
                                Text(category.rawValue).tag(category)
                            }
                        }
                        .pickerStyle(.inline)
                        
                        Toggle(isOn: $showFavoritesOnly) {
                            Label("Favorites only", systemImage: "star.fill")
                        }
                        
                    } label: {
                        Label("Filter", systemImage: "slider.horizontal.3")
                    }
                }
            }
            
            // memberi tulisan yang ditaruh di sisi kanan pada MacOS saat pengguna belum klik salah satu landmark (placeholder)
            Text("Select a Landmark")
        }
        
        // dapat menerapkan custom menu command yang sudah diatur di LandmarkCommands
        .focusedValue(\.selectedLandmark, $modelData.landmarks[index ?? 0])
    }
}

struct LandmarkList_Previews: PreviewProvider {
    
    //    di dalam variabel bawah ini dapat custom device pada preview
    static var previews: some View {
        LandmarkList().environmentObject(ModelData())
    }
}
