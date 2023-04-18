//
//  BadgeBackground.swift
//  0706012110020-Davina T W-AFL3
//
//  Created by MacBook Pro on 14/04/23.
//

import SwiftUI

struct BadgeBackground: View {
    var body: some View {
        
//        container view yang mendefinisikan kontennya sebagai fungsi dari ukuran dan ruang koordinatnya sendiri
        GeometryReader{ geometry in
            
//            kombinasi garis, kurva, dan drawing primitives lainnya untuk menghasilkan gambar
            Path { path in
                
                var width: CGFloat = min(geometry.size.width, geometry.size.height)
                let height = width
                
//                inisialisasi
                let xScale: CGFloat = 0.832
                let xOffset = (width * (1.0 - xScale)) / 2.0
                width *= xScale
                
//                menaruh titik letak pensil untuk menggambar gambar baru
                path.move(
                    to: CGPoint(
                        x: width * 0.95 + xOffset,
                        y: height * (0.20 + HexagonParameters.adjustment)
                    )
                )
                
//                menggambar hexagon dengan loop
                HexagonParameters.segments.forEach{ segment in
                    
//                    menggambarkan garis
                    path.addLine(
                        to: CGPoint(
                            x: width * segment.line.x + xOffset,
                            y: height * segment.line.y
                        )
                    )
                    
//                    membuat curva
                    path.addQuadCurve(
                        to: CGPoint(
                            x: width * segment.curve.x + xOffset,
                            y: height * segment.curve.y
                        ),
                        control: CGPoint(
                            x: width * segment.control.x + xOffset,
                            y: height * segment.control.y
                        )
                    )
                }
            }
            
//            memberi warna gradien dalam shape
            .fill(.linearGradient(
                Gradient(colors: [Self.gradientStart, Self.gradientEnd]),
                        startPoint: UnitPoint(x: 0.5, y: 0),
                        endPoint: UnitPoint(x: 0.5, y: 0.6)
            ))
        }
        
//        modifikasi warna gradien dalam shape
        .aspectRatio(1, contentMode: .fit)
    }
    
//    inisialisasi warna gradien
    static let gradientStart = Color(red: 239.0 / 255, green: 120.0 / 255, blue: 221.0 / 255)
    static let gradientEnd = Color(red: 239.0 / 255, green: 172.0 / 255, blue: 120.0 / 255)

}

struct BadgeBackground_Previews: PreviewProvider {
    static var previews: some View {
        BadgeBackground()
    }
}
