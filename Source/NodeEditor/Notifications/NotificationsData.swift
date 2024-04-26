//
//  NotificationsData.swift
//  Draggy
//
//  Created by Matt Novoselov on 22/03/24.
//

import SwiftUI

// Define a class to manage notification data
@Observable
class NotificationsData {
    
    // Array to store currently displayed notifications
    var displayed: [NotificationItem] = []
    
    // Function to add a new notification
    func add(_ text: String) {
        withAnimation {
            let newItem = NotificationItem(text: text)
            displayed.append(newItem)
        }
    }
}

// Define a struct to represent each notification item
struct NotificationItem: Identifiable {
    let id = UUID()
    // Text content of the notification
    let text: String
    // Flag to indicate if the notification is currently displayed
    var isShowing: Bool = true
}
