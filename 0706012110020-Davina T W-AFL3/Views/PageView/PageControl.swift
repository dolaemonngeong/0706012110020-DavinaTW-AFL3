//
//  PageControl.swift
//  0706012110020-Davina T W-AFL3
//
//  Created by MacBook Pro on 21/04/23.
//

import SwiftUI

import UIKit

struct PageControl: UIViewRepresentable {
    var numberOfPages: Int
    @Binding var currentPage: Int
    
    // method yang dipanggil saat pageControl dibuat
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    // method yang membuat & mengkonfigurasi UIPageControl
    func makeUIView(context: Context) -> UIPageControl {
        let control = UIPageControl()
        control.numberOfPages = numberOfPages
        control.addTarget(
            context.coordinator,
            action: #selector(Coordinator.updateCurrentPage(sender:)),
            for: .valueChanged)
        
        return control
    }
    
    // method yang dipanggil saat pengguna swipe halaman
    func updateUIView(_ uiView: UIPageControl, context: Context) {
        uiView.currentPage = currentPage
    }
    
    // class untuk menangani event dari UIPageControl dan memperbarui property currentPage melalui function updateCurrentPage
    class Coordinator: NSObject {
        var control: PageControl
        
        init(_ control: PageControl) {
            self.control = control
        }
        
        // menandai function yang berada di bawahnya sebagai panggilan dari code Objective-C
        @objc
        func updateCurrentPage(sender: UIPageControl) {
            control.currentPage = sender.currentPage
        }
    }
}
