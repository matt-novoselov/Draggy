//
//  AddButtons.swift
//  NewNodeEditor
//
//  Created by Matt Novoselov on 19/03/24.
//

import SwiftUI

struct AddButtons: View {
    
    @Environment(NodeData.self)
    private var nodeData: NodeData
    
    var body: some View {
        HStack {
            Group{
                Button("Add text node") {
                    withAnimation{
                        nodeData.textNodes.append(TextNode())
                    }
                }
                
                Button("Add image node") {
                    withAnimation{
                        nodeData.imageNodes.append(ImageNode())
                    }
                }
                
                Button("Add color node") {
                    withAnimation{
                        nodeData.colorNodes.append(ColorNode())
                    }
                }
                
                Button("Add opacity node") {
                    withAnimation{
                        nodeData.opacityNodes.append(OpacityNode())
                    }
                }
            }
            .buttonStyle(BorderedProminentButtonStyle())
        }
    }
}
