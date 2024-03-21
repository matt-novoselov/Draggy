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
            }
            .buttonStyle(BorderedProminentButtonStyle())
        }
    }
}
