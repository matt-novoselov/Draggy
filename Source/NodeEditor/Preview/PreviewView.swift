//
//  PreviewView.swift
//  Draggy
//
//  Created by Matt Novoselov on 19/03/24.
//

import SwiftUI

struct PreviewView: View {
    
    // Load NodeData from Environment
    @Environment(NodeData.self)
    private var nodeData: NodeData
    
    var body: some View {
        
        // Main iPhone Bezel
        Image(.iphoneBezel)
            .resizable()
            .scaledToFit()
            .allowsHitTesting(false)
            .overlay{
                // Overlay iPhone dynamic island on the top
                Image(.iphoneIsland)
                    .resizable()
                    .scaledToFit()
                    .allowsHitTesting(false)
            }
            // The layer with all node preview results
            .background{
                VStack{
                    // Display each Node's uiPreviewElement (if it exist)
                    ForEach(nodeData.nodes) { node in
                        
                        // MARK: Only add nodes that are independent from each other and not part of a bigger node
                        let isPartOfAnotherNode = node.linkedToNodes.contains { $0 is ButtonNode }
                        
                        if !isPartOfAnotherNode {
                            AnyView(node.uiPreviewElement)
                        }
                    }
                }
                .padding()
                .padding(.top)
            }
            // White background of the iPhone clipped into the iPhone shape
            .background{
                Color.white
                    .mask{
                        Image(.iphoneBackground)
                            .resizable()
                            .scaledToFit()
                            .padding(.all, 1)
                    }
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.nodeBackground)
        
    }
}

#Preview {
    PreviewView()
        .environment(NodeData())
}
