//
//  NotificationsData.swift
//  SwiftUI-Node-Editor
//
//  Created by Matt Novoselov on 22/03/24.
//

import SwiftUI

@Observable
class NotificationsData {
    struct NotificationItem: Identifiable {
        let id = UUID()
        let text: String
        var isShowing: Bool = true
    }
    
    var displayed: [NotificationItem] = []
    
    func add(_ text: String) {
        withAnimation {
            let newItem = NotificationItem(text: text)
            displayed.append(newItem)
        }
    }
}
