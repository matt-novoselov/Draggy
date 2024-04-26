//
//  LinkingView.swift
//  Draggy
//
//  Created by Matt Novoselov on 20/03/24.
//

import SwiftUI

struct LinkingView: View {
    
    // Load NodeData from Environment
    @Environment(NodeData.self)
    private var nodeData: NodeData
    
    var body: some View {
        
        ZStack {
            // Iterate over all nodes in nodeData
            ForEach(nodeData.nodes) { node in
                // Iterate over linkedNodes of each node
                ForEach(node.linkedNodes) { linkedNode in
                    // Draw a Bezier path between selectedNode1 and selectedNode2
                    BezierPathStatic(
                        selectedNode1: node,
                        selectedNode2: linkedNode
                    )
                }
            }
        }
        
    }
}
