//
//  Draggy.swift
//  Draggy
//
//  Created by Matt Novoselov on 19/03/24.
//

import SwiftUI

@main
struct Draggy: App {
    
    // State variables to hold data for nodes, canvas, and notifications
    @State var nodeData: NodeData = NodeData()
    @State var canvasData: CanvasData = CanvasData()
    @State var notificationsData: NotificationsData = NotificationsData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .statusBarHidden()
                .preferredColorScheme(.dark)
                .persistentSystemOverlays(.hidden)
            
                // Pass state variable as environment
                .environment(nodeData)
                .environment(canvasData)
                .environment(notificationsData)
        }
    }
}

