//
//  AddButtons.swift
//  NewNodeEditor
//
//  Created by Matt Novoselov on 19/03/24.
//

import SwiftUI

struct AddButtons: View {
    @EnvironmentObject var nodeData: NodeData
    
    var body: some View {
        HStack {
            Group{
                Button("Add text node") {
                    nodeData.textNodes.append(TextNode())
                }
                
                Button("Add image node") {
                    nodeData.imageNodes.append(ImageNode())
                }
                
                Button("Add color node") {
                    nodeData.colorNodes.append(ColorNode())
                }
                
                Button("Add opacity node") {
                    nodeData.opacityNodes.append(OpacityNode())
                }
                
                Button("link 0 0") {
                    nodeData.textNodes[0].addLinkedNode(nodeData.colorNodes[0])
                }
                
                Button("link 0 0") {
                    nodeData.textNodes[0].addLinkedNode(nodeData.opacityNodes[0])
                }
                
                Button("image link 0 0") {
                    nodeData.imageNodes[0].addLinkedNode(nodeData.opacityNodes[0])
                }
                
                Button("change color") {
                    nodeData.colorNodes[0].color = .green
                }
            }
            .buttonStyle(BorderedProminentButtonStyle())
        }
    }
}
