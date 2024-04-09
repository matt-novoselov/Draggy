//
//  ArcSearch.swift
//  SwiftUI-Node-Editor
//
//  Created by Matt Novoselov on 08/04/24.
//

import SwiftUI

struct SmartSearch: View {
    
    let buttonListViewModel = ButtonListViewModel()
    @State private var searchText = ""
    
    var body: some View {
        
        NavigationStack{
            List {
                ForEach(buttonListViewModel.filtered(searchText)) { button in
                    singleSearchButton(searchButton: button)
                }
            }
            .searchable(text: $searchText)
            .toolbar{
                ToolbarItem(placement: .topBarLeading) {
                    ExitButtonView()
                }
            }
        }
        
    }
}

struct singleSearchButton: View {
    
    @Environment(NodeData.self)
    private var nodeData: NodeData
    
    @Environment(CanvasData.self)
    private var canvasData: CanvasData
    
    @Environment(\.dismiss) var dismiss
    
    var searchButton: ButtonItem
    
    var body: some View {
        
        Button(action: {addNode(searchButton.nodeType)}) {
            
            Label(
                title: {
                    Text(searchButton.title)
                        .fontWeight(.medium)
                },
                icon: {
                    Image(systemName: "circle")
                        .opacity(0)
                        .padding(.all, 4)
                        .background{
                            Color.white
                                .cornerRadius(5)
                                .opacity(0.1)
                        }
                        .overlay{
                            Image(systemName: searchButton.iconName)
                                .foregroundStyle(.gray)
                        }
                }
            )
            
        }
        .buttonStyle(PlainButtonStyle())
        
    }
    
    private func addNode(_ nodeType: Node.Type) {
        guard let canvasGeometry = canvasData.canvasGeometry else { return }
        
        let centerX = canvasGeometry.size.width / 2
        let centerY = canvasGeometry.size.height / 2
        
        withAnimation {
            nodeData.nodes.append(nodeType.init(position: CGPoint(x: centerX, y: centerY)))
        }
        
        dismiss()
    }
}

#Preview {
    SmartSearch()
        .environment(NodeData())
        .environment(CanvasData())
}
