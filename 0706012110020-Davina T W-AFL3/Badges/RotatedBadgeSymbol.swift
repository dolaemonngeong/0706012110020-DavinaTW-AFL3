//
//  RotatedBadgeSymbol.swift
//  0706012110020-Davina T W-AFL3
//
//  Created by MacBook Pro on 16/04/23.
//

import SwiftUI

struct RotatedBadgeSymbol: View {
    let angle: Angle
        
        var body: some View {
            BadgeSymbol()
                .padding(-60)
                .rotationEffect(angle, anchor: .bottom)
        }
}

struct RotatedBadgeSymbol_Previews: PreviewProvider {
    static var previews: some View {
        RotatedBadgeSymbol(angle: Angle(degrees: 5))
    }
}
