//
//  ContentView.swift
//  NewNodeEditor
//
//  Created by Matt Novoselov on 19/03/24.
//

import SwiftUI

struct ContentView: View {
    
//    @State private var currentZoom = 0.0
//    @State private var totalZoom = 1.0
//    
//    let minZoom: Double = 0.5
//    let maxZoom: Double = 2
    
    var body: some View {
        
        NavigationSplitView {
            PreviewView()
        }
        detail: {
            CanvasView()
//                .scaleEffect(currentZoom + totalZoom)
//                .gesture(
//                    MagnifyGesture()
//                        .onChanged { value in
//                            currentZoom = value.magnification - 1
//                        }
//                        .onEnded { value in
//                            totalZoom += currentZoom
//                            currentZoom = 0
//                        }
//                )
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
