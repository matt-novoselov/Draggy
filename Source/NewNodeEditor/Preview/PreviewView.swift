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
                .overlay{
                    Image(.iphoneIsland)
                        .resizable()
                        .scaledToFit()
                }
                .background{
                    VStack{
                        ForEach(nodeData.nodes) { node in
                            AnyView(node.uiPreviewElement)
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
