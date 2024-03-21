//
//  LinkingView.swift
//  SwiftUI-Node-Editor
//
//  Created by Matt Novoselov on 20/03/24.
//

import SwiftUI

struct LinkingView: View {
    
    @Environment(NodeData.self)
    private var nodeData: NodeData
    
    var body: some View {
        
        ZStack{
            ForEach(nodeData.textNodes) { selectedNode in
                ForEach(selectedNode.linkedNodes.indices, id: \.self){ index in
                    BezierPath(selectedNode1: selectedNode, selectedNode2: selectedNode.linkedNodes[index])
                }
            }
            
            ForEach(nodeData.imageNodes) { selectedNode in
                ForEach(selectedNode.linkedNodes.indices, id: \.self){ index in
                    BezierPath(selectedNode1: selectedNode, selectedNode2: selectedNode.linkedNodes[index])
                }
            }
            
            ForEach(nodeData.colorNodes) { selectedNode in
                ForEach(selectedNode.linkedNodes.indices, id: \.self){ index in
                    BezierPath(selectedNode1: selectedNode, selectedNode2: selectedNode.linkedNodes[index])
                }
            }
            
            ForEach(nodeData.opacityNodes) { selectedNode in
                ForEach(selectedNode.linkedNodes.indices, id: \.self){ index in
                    BezierPath(selectedNode1: selectedNode, selectedNode2: selectedNode.linkedNodes[index])
                }
            }

        }
    }
}

