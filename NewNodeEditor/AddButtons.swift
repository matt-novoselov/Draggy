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
                        nodeData.nodes.append(
                            TextNode()
                        )
                    }
                }
                
                Button("Add image node") {
                    withAnimation{
                        nodeData.nodes.append(ImageNode())
                    }
                }
                
                Button("Add color node") {
                    withAnimation{
                        nodeData.nodes.append(ColorNode())
                    }
                }
                
                Button("Add opacity node") {
                    withAnimation{
                        nodeData.nodes.append(OpacityNode())
                    }
                }
            }
            .buttonStyle(BorderedProminentButtonStyle())
        }
    }
}
