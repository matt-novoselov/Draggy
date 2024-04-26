//
//  SFSymbolsPicker.swift
//  Draggy
//
//  Created by Matt Novoselov on 09/04/24.
//

import SwiftUI

// A view for picking SF Symbols
// This should be presented as a sheet
struct SFSymbolsPicker: View {
    
    // State variable for search text
    @State private var searchText = ""
    
    // Binding for selected symbol
    @Binding var selectedSymbol: String
    
    // Define grid layout columns
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        
        NavigationStack {
            ScrollView {
                
                // Display symbols in a grid
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(getSFSymbolsContaining(searchText), id: \.self) { symbol in
                        // Display each symbol as a button
                        symbolButton(symbol: symbol, selectedSymbol: $selectedSymbol)
                    }
                }
                .padding()
                
            }
            // Enable searching for symbols
            .searchable(text: $searchText)
            
            // Add a toolbar with exit button
            .toolbar{
                ToolbarItem(placement: .topBarLeading) {
                    ExitButtonView()
                }
            }
        }
    }
    
}

// A button for selecting a symbol
struct symbolButton: View {
    
    // The symbol to display
    var symbol: String
    
    // Binding for selected symbol
    @Binding var selectedSymbol: String
    
    // Environment value for dismissing views
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        
        Button(
            action: {
                // Set the selected symbol and dismiss the view
                selectedSymbol = symbol
                dismiss()
            }
        )
        {
            // Display the symbol with the fixed size
            Group{
                Image(systemName: "circle")
                    .opacity(0)
                    .padding()
                    .background{
                        // Add rounded rectangle to the background
                        Color.white
                            .cornerRadius(5)
                            .opacity(0.1)
                    }
                    .overlay{
                        Image(systemName: symbol)
                    }
            }
            .font(.title2)
            .fontWeight(.bold)
        }
        .buttonStyle(PlainButtonStyle())
        
    }
}


#Preview {
    SFSymbolsPicker(selectedSymbol: .constant("star.fill"))
}
