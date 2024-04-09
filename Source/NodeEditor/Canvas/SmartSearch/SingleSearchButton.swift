//
//  singleSearchButton.swift
//  SwiftNode
//
//  Created by Matt Novoselov on 09/04/24.
//

import SwiftUI

struct SingleSearchButton: View {
    
    @Environment(NodeData.self)
    private var nodeData: NodeData
    
    @Environment(CanvasData.self)
    private var canvasData: CanvasData
    
    @Environment(\.dismiss) var dismiss
    
    var searchButton: ButtonItem
    
    var body: some View {
        
        Button(action: {addNode(searchButton.nodeType)}) {
            
            Label(
                title: {
                    Text(searchButton.title)
                        .fontWeight(.medium)
                        .foregroundStyle(Color.white)
                },
                icon: {
                    Image(systemName: "circle")
                        .opacity(0)
                        .padding(.all, 4)
                        .background{
                            Color.white
                                .cornerRadius(5)
                                .opacity(0.1)
                        }
                        .overlay{
                            Image(systemName: searchButton.iconName)
                                .foregroundStyle(.gray)
                        }
                }
            )
            
        }
        
    }
    
    private func addNode(_ nodeType: Node.Type) {
        guard let canvasGeometry = canvasData.canvasGeometry else { return }
        
        let centerX = canvasGeometry.size.width / 2
        let centerY = canvasGeometry.size.height / 2
        
        nodeData.addNode(nodeType, position: CGPoint(x: centerX, y: centerY))
        
        dismiss()
    }
}

#Preview {
    SingleSearchButton(searchButton: ButtonListViewModel().buttons.first!)
        .environment(NodeData())
        .environment(CanvasData())
}
