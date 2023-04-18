//
//  Badge.swift
//  0706012110020-Davina T W-AFL3
//
//  Created by MacBook Pro on 16/04/23.
//

import SwiftUI

struct Badge: View {
    var badgeSymbols: some View {
        
//        membuat 8 BadgeSymbol yang ditaruh di luar lingkatan dengan menggunakan loop
            ForEach(0..<8) { index in
                RotatedBadgeSymbol(
                    angle: .degrees(Double(index) / Double(8)) * 360.0
                )
            }
        
//        mengatur skala ukuran
            .opacity(0.5)
        }
        
        var body: some View {
            
//            tata letak tampilan badgeSymbols yang berada di atas BadgeBackground()
            ZStack {
                BadgeBackground()
                
                GeometryReader { geometry in
                    badgeSymbols
                        .scaleEffect(1.0 / 4.0, anchor: .top)
                        .position(x: geometry.size.width / 2.0, y: (3.0 / 4.0) * geometry.size.height)
                }
            }
            
//            mengatur skala tampilan agar sesuai dengan BadgeBackground
            .scaledToFit()
        }
}

struct Badge_Previews: PreviewProvider {
    static var previews: some View {
        Badge()
    }
}
