//
//  Draggy.swift
//  NewNodeEditor
//
//  Created by Matt Novoselov on 19/03/24.
//

import SwiftUI

@main
struct Draggy: App {
    @State var nodeData: NodeData = NodeData()
    @State var canvasData: CanvasData = CanvasData()
    @State var notificationsData: NotificationsData = NotificationsData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .statusBarHidden()
                .preferredColorScheme(.dark)
                .persistentSystemOverlays(.hidden)
                .environment(nodeData)
                .environment(canvasData)
                .environment(notificationsData)
        }
    }
}

