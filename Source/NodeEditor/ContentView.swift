//
//  ContentView.swift
//  Draggy
//
//  Created by Matt Novoselov on 19/03/24.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        
        // The Preview View with iPhone bezel is visible on the left of the screen and can be hidden to expand canvas
        NavigationSplitView {
            PreviewView()
        }
        detail: {
            // Main canvas View where Node linking is happening
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
