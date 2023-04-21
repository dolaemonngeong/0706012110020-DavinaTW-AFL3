//
//  CircleImage.swift
//  0706012110020-Davina T W-AFL3
//
//  Created by MacBook Pro on 11/04/23.
//

import SwiftUI

struct CircleImage: View {
    var image: Image
    
    var body: some View {
        
        //        menampilkan gambar dari variabel yang telah diinisialisasi di atas
        image
        
        //        mengaplikasikan circular clipping shape ke gambar. pada bagian ini menggunakan lingkaran
            .clipShape(Circle())
        
        //        memberikan border/stroke
            .overlay {
                Circle().stroke(.white, lineWidth: 4)
            }
        
        //        memberikan efek bayangan
            .shadow(radius: 7)
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        //        memberikan nama gambar
        CircleImage(image: Image("turtlerock"))
    }
}
