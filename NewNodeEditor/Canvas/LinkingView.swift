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
        
        @Bindable var nodeData = nodeData
        
        ZStack{
            ForEach(nodeData.textNodes.indices, id: \.self) { index in
                ForEach(nodeData.textNodes[index].linkedNodes.indices, id: \.self){ index2 in
                    BezierPath(startPoint: $nodeData.textNodes[index].position, endPoint: $nodeData.textNodes[index].linkedNodes[index2].position)
                }
            }
            
            ForEach(nodeData.imageNodes.indices, id: \.self) { index in
                ForEach(nodeData.imageNodes[index].linkedNodes.indices, id: \.self){ index2 in
                    BezierPath(startPoint: $nodeData.imageNodes[index].position, endPoint: $nodeData.imageNodes[index].linkedNodes[index2].position)
                }
            }
            
            ForEach(nodeData.opacityNodes.indices, id: \.self) { index in
                ForEach(nodeData.opacityNodes[index].linkedNodes.indices, id: \.self){ index2 in
                    BezierPath(startPoint: $nodeData.opacityNodes[index].position, endPoint: $nodeData.opacityNodes[index].linkedNodes[index2].position)
                }
            }
            
            ForEach(nodeData.colorNodes.indices, id: \.self) { index in
                ForEach(nodeData.colorNodes[index].linkedNodes.indices, id: \.self){ index2 in
                    BezierPath(startPoint: $nodeData.colorNodes[index].position, endPoint: $nodeData.colorNodes[index].linkedNodes[index2].position)
                }
            }
        }
    }
}

