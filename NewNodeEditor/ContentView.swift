//
//  ContentView.swift
//  NewNodeEditor
//
//  Created by Matt Novoselov on 19/03/24.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        
        HStack{
            PreviewView()
            
            ZStack(alignment: .top){
                CanvasView()
                
                AddButtons()
            }
        }

    }
}

#Preview {
    ContentView()
        .environment(NodeData())
        .environment(CanvasData())
}
