//
//  PageView.swift
//  0706012110020-Davina T W-AFL3
//
//  Created by MacBook Pro on 21/04/23.
//

import SwiftUI

struct PageView<Page: View>: View {
    var pages: [Page]
    
    @State private var currentPage = 1
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            // memanggil struct PageViewController yang menampilkan seluruh gambar dari array features
            PageViewController(pages: pages, currentPage: $currentPage)
            
            // memanggil struct PageControl untuk memberikan dot yang menampilkan urutan array features
            PageControl(numberOfPages: pages.count, currentPage: $currentPage)
                .frame(width: CGFloat(pages.count * 18))
                .padding(.trailing)
        }
    }
}

struct PageView_Previews: PreviewProvider {
    static var previews: some View {
        PageView(pages: ModelData().features.map { FeatureCard(landmark: $0) })
            .aspectRatio(3 / 2, contentMode: .fit)
    }
}
