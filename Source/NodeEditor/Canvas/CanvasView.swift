//
//  CanvasView.swift
//  Draggy
//
//  Created by Matt Novoselov on 19/03/24.
//

import SwiftUI

struct CanvasView: View {
    
    // Load NodeData from Environment
    @Environment(NodeData.self)
    private var nodeData: NodeData
    
    // Load CanvasData from Environment
    @Environment(CanvasData.self)
    private var canvasData: CanvasData
    
    // Store maximum z index that one of the nodes has
    // This is needed to create overlap and hovering effect on node drag
    @State var maxZIndex: Double = 1
    
    var body: some View {
        
        // Make canvas data bindable
        @Bindable var canvasData = canvasData
        
        // Display each node's uiNodeElement, that is contained in nodeData
        ZStack{
            ForEach(nodeData.nodes){ node in
                BaseUINode(
                    selectedNode: node,
                    customOverlay: AnyView(node.uiNodeElement),
                    maxZIndex: $maxZIndex
                )
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        
        // Display linking View on the background of nodes
        // Linking view is responsible for displaying connections between nodes
        .background {
            LinkingView()
        }
        // Display background
        // MARK: The background should be infinite and scrollable
        .background{
            Image(.gridBackground)
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
                // Open smart search menu on double tap
                .onTapGesture(count: 2, perform: {
                    canvasData.isMenuExpanded = true
                })
        }
        
        // Determine canvas size using Geometry Reader
        .overlay{
            GeometryReader{ proxy in
                Color.clear
                    .onAppear(){
                        canvasData.canvasGeometry = proxy
                    }
            }
        }
        
        // Present Smart Search node selection menu using sheet
        .sheet(isPresented: $canvasData.isMenuExpanded, content: {
            SmartSearch()
        })

    }
    
}

#Preview {
    CanvasView()
        .environment(NodeData())
        .environment(CanvasData())
}
