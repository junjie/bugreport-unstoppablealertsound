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
            HStack {
                Button("Fire Notification") {
                    Notifications.shared.fireNotification()
                }
                Spacer().frame(width: 20)
                Button("Stop Notification") {
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
