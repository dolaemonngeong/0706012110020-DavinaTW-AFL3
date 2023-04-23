//
//  NotificationView.swift
//  WatchLandmark Watch App
//
//  Created by MacBook Pro on 22/04/23.
//

import SwiftUI

struct NotificationView: View {
    var title: String?
    var message: String?
    var landmark: Landmark?
    
    var body: some View {
        VStack {
            // menampilkan gambar jika tidak ada data landmark
            if landmark != nil {
                CircleImage(image: landmark!.image.resizable())
                    .scaledToFit()
            }
            
            // menampilkan judul jika variabel "title" memiliki value. jika tidak, tampilkan tulisan "Unknown Landmark"
            Text(title ?? "Unknown Landmark")
                .font(.headline)
            
            Divider()
            
            // menampilkan pesan jika variabel "message" memiliki value. jika tidak, tampilkan tulisan "You are within 5 miles of one of your favorite landmarks."
            Text(message ?? "You are within 5 miles of one of your favorite landmarks.")
                .font(.caption)
        }
        .lineLimit(0)
    }
}

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NotificationView()
            NotificationView(title: "Turtle Rock",
                             message: "You are within 5 miles of Turtle Rock.",
                             landmark: ModelData().landmarks[0])
        }
    }
}
