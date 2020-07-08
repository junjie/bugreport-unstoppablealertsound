//
//  ContentView.swift
//  UnstoppableNotificationSound
//
//  Created by Lin Junjie on 8/7/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("This demo project schedules a notification with a long alert sound with Notification Center.")
            Spacer().frame(height: 20)
            HStack {
                Button("Fire Now") {
                    Notifications.shared.fireNotification()
                }
                Button("Fire 5s Later") {
                    Notifications.shared.fireNotification(delay: 5)
                }
                Button("Remove Notification") {
                    Notifications.shared.cancelNotification()
                }
            }
        }
        .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
        .frame(minWidth: 400, minHeight: 200)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
