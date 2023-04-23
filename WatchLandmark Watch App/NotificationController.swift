//
//  NotificationController.swift
//  WatchLandmark Watch App
//
//  Created by MacBook Pro on 22/04/23.
//

import WatchKit
import SwiftUI
import UserNotifications

class NotificationController: WKUserNotificationHostingController<NotificationView> {
    var landmark: Landmark?
    var title: String?
    var message: String?
    
    let landmarkIndexKey = "landmarkIndex"
    
    override var body: NotificationView {
        
        // memanggil struct NotificationView
        NotificationView(
            title: title,
            message: message,
            landmark: landmark
        )
    }
    
    // method yang dipanggil saat Watch App akan aktif
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    // method yang dipanggil saat Watch App akan tidak aktif
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    // method yang dipanggil saat notifikasi diterima dan membutuhkan dynamic notification interface
    override func didReceive(_ notification: UNNotification) {
        let modelData = ModelData()
        
        let notificationData =
        notification.request.content.userInfo as? [String: Any]
        
        let aps = notificationData?["aps"] as? [String: Any]
        let alert = aps?["alert"] as? [String: Any]
        
        // memperbarui property NotificationControler (title, message, landmark)
        title = alert?["title"] as? String
        message = alert?["body"] as? String
        
        if let index = notificationData?[landmarkIndexKey] as? Int {
            landmark = modelData.landmarks[index]
        }
    }
}
