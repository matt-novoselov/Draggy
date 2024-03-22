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
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(nodeData)
                .preferredColorScheme(.light)
        }
    }
}

