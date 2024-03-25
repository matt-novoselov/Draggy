//
//  NewNodeEditorApp.swift
//  NewNodeEditor
//
//  Created by Matt Novoselov on 19/03/24.
//

import SwiftUI

@main
struct NewNodeEditorApp: App {
    @State var nodeData: NodeData = NodeData()
    @State var canvasData: CanvasData = CanvasData()
    @State var notificationsData: NotificationsData = NotificationsData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(nodeData)
                .environment(canvasData)
                .environment(notificationsData)
                .preferredColorScheme(.light)
        }
    }
}

