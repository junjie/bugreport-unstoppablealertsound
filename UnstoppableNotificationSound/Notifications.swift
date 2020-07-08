//
//  Notifications.swift
//  UnstoppableNotificationSound
//
//  Created by Lin Junjie on 8/7/20.
//

import Foundation
import UserNotifications

class Notifications: NSObject, UNUserNotificationCenterDelegate {
    static let shared = Notifications()
    private override init() {
        super.init()
        UNUserNotificationCenter.current().delegate = self
    }

    struct Constants {
        static let NotificationID = "unstoppablenotificationsound"
    }
    
    func fireNotification() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            if granted {
                DispatchQueue.main.async {
                    let content = UNMutableNotificationContent()
                    content.title = "Weekly Staff Meeting"
                    content.body = "Every Tuesday at 2pm"
                    content.sound = .init(named: UNNotificationSoundName("DigitalWatchFS22627.m4a"))
                    let request = UNNotificationRequest(identifier: Constants.NotificationID,
                                                        content: content, trigger: nil)
                    
                    UNUserNotificationCenter.current().add(request) { error in
                        guard let nErr = error else {
                            print("Notification fired!")
                            return
                        }
                        print("Notification failed to fire because of error \(nErr.localizedDescription)")
                    }
                }
            } else if let aErr = error {
                print("Permission to use notification not granted: \(aErr.localizedDescription)")
            }
        }
    }
    
    func cancelNotification() {
        UNUserNotificationCenter.current().removeDeliveredNotifications(withIdentifiers: [Constants.NotificationID])
    }
    
    // MARK: - UNUserNotificationCenterDelegate
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.badge, .sound, .banner, .list])
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        completionHandler()
    }
    
}
