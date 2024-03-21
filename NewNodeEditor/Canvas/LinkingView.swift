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
            
            ForEach(nodeData.nodes){ node in
                ForEach(node.linkedNodes){ linkedNode in
                    BezierPathStatic(
                        selectedNode1: node,
                        selectedNode2: linkedNode
                    )
                }
            }
            
        }
        
    }
}

