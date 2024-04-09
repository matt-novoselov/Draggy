//
//  PreviewView.swift
//  NewNodeEditor
//
//  Created by Matt Novoselov on 19/03/24.
//

import SwiftUI

struct PreviewView: View {
    
    @Environment(NodeData.self)
    private var nodeData: NodeData
    
    var body: some View {
        
        ZStack{
            
            Image(.iphoneBezel)
                .resizable()
                .scaledToFit()
                .allowsHitTesting(false)
                .overlay{
                    Image(.iphoneIsland)
                        .resizable()
                        .scaledToFit()
                        .allowsHitTesting(false)
                }
                .background{
                    VStack{
                        ForEach(nodeData.nodes) { node in
                            
                            // MARK: 
                            let containsButtonNode = node.linkedToNodes.contains { $0 is ButtonNode }

                            if !containsButtonNode {
                                AnyView(node.uiPreviewElement)
                            }
                        }
                    }
                    .padding()
                    .padding(.top)
                }
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
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.nodeBackground)
        
    }
}

#Preview {
    PreviewView()
        .environment(NodeData())
}
