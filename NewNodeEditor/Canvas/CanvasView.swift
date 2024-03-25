//
//  CanvasView.swift
//  NewNodeEditor
//
//  Created by Matt Novoselov on 19/03/24.
//

import SwiftUI

struct CanvasView: View {
    
    @Environment(NodeData.self)
    private var nodeData: NodeData
    
    @Environment(CanvasData.self)
    private var canvasData: CanvasData
    
    @State var maxZIndex: Double = 1
    
    var body: some View {
        
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
        .background(.gray)
        .overlay {
            LinkingView()
        }
        .overlay{
            GeometryReader{ proxy in
                Color.clear
                    .onAppear(){
                        canvasData.canvasGeometry = proxy
                    }
            }
        }

    }
    
}

#Preview {
    CanvasView()
        .environment(NodeData())
        .environment(CanvasData())
}
