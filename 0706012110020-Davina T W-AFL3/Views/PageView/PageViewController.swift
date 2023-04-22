//
//  PageViewController.swift
//  0706012110020-Davina T W-AFL3
//
//  Created by MacBook Pro on 21/04/23.
//

import SwiftUI
import UIKit

struct PageViewController<Page: View>: UIViewControllerRepresentable {
    var pages: [Page]
    
    // binding ke variabel currentPage yang ditampilkan struct PageViewController
    @Binding var currentPage: Int
    
    //    method yang membuat instance kelas Coordinator yang bertanggung jawab untuk manage data source dan delegate dari UIPageViewController
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    //    method yang membuat instance UIPageViewController baru dengan mengatur properti gaya transisi dan orientasi navigasinya, serta menyetel data source dan delegate-nya
    func makeUIViewController(context: Context) -> UIPageViewController {
        let pageViewController = UIPageViewController(
            transitionStyle: .scroll,
            navigationOrientation: .horizontal)
        
        pageViewController.dataSource = context.coordinator
        pageViewController.delegate = context.coordinator
        
        return pageViewController
    }
    
    // method yang memperbarui UIPageViewController dengan pengontrol tampilan saat ini pada indeks yang ditentukan
    func updateUIViewController(_ pageViewController: UIPageViewController, context: Context) {
        pageViewController.setViewControllers(
            [context.coordinator.controllers[0]], direction: .forward, animated: true)
    }
    
    // class pembantu yang bertanggung jawab untuk menyediakan view controllers yang harus ditampilkan dan melacak index halaman yang dibuka pengguna
    class Coordinator: NSObject, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
        var parent: PageViewController
        var controllers = [UIViewController]()
        
        init(_ pageViewController: PageViewController) {
            parent = pageViewController
            controllers = parent.pages.map { UIHostingController(rootView: $0) }
        }
        
        // method yang mengatur tampilan mana yang harus ditampilkan sebelum view controller diberikan
        func pageViewController(
            _ pageViewController: UIPageViewController,
            viewControllerBefore viewController: UIViewController) -> UIViewController?
        {
            guard let index = controllers.firstIndex(of: viewController) else {
                return nil
            }
            if index == 0 {
                return controllers.last
            }
            return controllers[index - 1]
        }
        
        // method yang mengatur tampilan mana yang harus ditampilkan setelah view controller diberikan
        func pageViewController(
            _ pageViewController: UIPageViewController,
            viewControllerAfter viewController: UIViewController) -> UIViewController?
        {
            guard let index = controllers.firstIndex(of: viewController) else {
                return nil
            }
            if index + 1 == controllers.count {
                return controllers.first
            }
            return controllers[index + 1]
        }
        
        // method yang digunakan untuk memperbarui indeks halaman saat ini pada properti currentPage PageViewController
        func pageViewController(
            _ pageViewController: UIPageViewController,
            didFinishAnimating finished: Bool,
            previousViewControllers: [UIViewController],
            transitionCompleted completed: Bool) {
                if completed,
                   let visibleViewController = pageViewController.viewControllers?.first,
                   let index = controllers.firstIndex(of: visibleViewController) {
                    parent.currentPage = index
                }
            }
        
    }
}
