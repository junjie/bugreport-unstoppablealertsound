//
//  ContentView.swift
//  UnstoppableNotificationSoundiOS
//
//  Created by Lin Junjie on 8/7/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("This demo project schedules a notification with a long alert sound with Notification Center.").padding(EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 15))
            Spacer().frame(height: 20)
            VStack {
                Button("Fire Now") {
                    Notifications.shared.fireNotification()
                }
                Spacer().frame(height: 20)
                Button("Fire 5s Later") {
                    Notifications.shared.fireNotification(delay: 5)
                }
                Spacer().frame(height: 20)
                Button("Remove Notification") {
                    Notifications.shared.cancelNotification()
                }
            }
        }
        .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
