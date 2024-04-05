//
//  ContentView.swift
//  NewNodeEditor
//
//  Created by Matt Novoselov on 19/03/24.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        
        NavigationSplitView {
            PreviewView()
        }
        detail: {
            CanvasView()
                .overlay{
                    NotificationsView()
                }
                .toolbar{
                    AddButtons()
                }
        }

    }
}

#Preview {
    ContentView()
        .statusBarHidden()
        .preferredColorScheme(.dark)
        .persistentSystemOverlays(.hidden)
        .environment(NodeData())
        .environment(CanvasData())
        .environment(NotificationsData())
}
