//
//  ArcSearch.swift
//  Draggy
//
//  Created by Matt Novoselov on 08/04/24.
//

import SwiftUI

// Smart search is presented when user clicks the "+" icon or double taps on the canvas
// Smart Search helps users to find nodes faster
struct SmartSearch: View {
    
    // Load all buttons from the View Model
    let buttonListViewModel = ButtonListViewModel()
    
    // Text that user inputs to the search field
    @State private var searchText = ""
    
    var body: some View {
        
        NavigationStack {
            List {
                // Iterate over each NodeCategory
                ForEach(NodeCategory.allCases, id: \.self) { category in
                    // Filter buttons based on searchText and current category.
                    let filteredButtons = buttonListViewModel.filtered(searchText, category: category)
                    
                    // Check if there are any buttons after filtering.
                    if !filteredButtons.isEmpty {
                        // Create a Section with a header displaying the category title.
                        Section(header: Text(category.title)) {
                            // Iterate over filtered buttons
                            ForEach(filteredButtons) { button in
                                SingleSearchButton(searchButton: button)
                            }
                        }
                    }
                    
                }
            }
            // Make the List searchable using the searchText binding.
            .searchable(text: $searchText)
            
            // Place an ExitButtonView in the top bar leading position.
            .toolbar {
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
