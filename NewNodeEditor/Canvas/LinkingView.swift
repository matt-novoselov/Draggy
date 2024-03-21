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
            
            ForEach(nodeData.nodes.indices, id: \.self){ index in
                ForEach(nodeData.nodes[index].linkedNodes.indices, id: \.self){ index2 in
                    BezierPath(selectedNode1: nodeData.nodes[index], selectedNode2: nodeData.nodes[index].linkedNodes[index2])
                }
            }
            
        }
        
    }
}

