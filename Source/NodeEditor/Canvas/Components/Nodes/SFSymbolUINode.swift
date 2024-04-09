//
//  SFSymbolUINode.swift
//  SwiftNode
//
//  Created by Matt Novoselov on 09/04/24.
//

import SwiftUI

struct SFSymbolUINode: View {
    var selectedNode: SFSymbolNode
    
    var body: some View {
        @Bindable var selectedNode = selectedNode
        
        VStack{
            Text(selectedNode.value)
            
            Image(systemName: selectedNode.value)
        }
        
    }
}
