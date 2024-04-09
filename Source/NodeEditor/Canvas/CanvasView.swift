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
    
    //    @State private var currentZoom = 0.0
    //    @State private var totalZoom = 1.0
    //
    //    let minZoom: Double = 0.5
    //    let maxZoom: Double = 2
    
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
        .background {
            LinkingView()
        }
        .background{
            Image(.gridBackground)
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
                .onTapGesture(count: 2, perform: {
                    print("Expanding the menu...")
                })
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
