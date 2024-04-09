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
                ForEach(NodeCategory.allCases, id: \.self) { category in
                    let filteredButtons = buttonListViewModel.filtered(searchText, category: category)
                    if !filteredButtons.isEmpty {
                        Section(header: Text(category.title)) {
                            ForEach(filteredButtons) { button in
                                SingleSearchButton(searchButton: button)
                            }
                        }
                    }
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

#Preview {
    SmartSearch()
        .environment(NodeData())
        .environment(CanvasData())
}
