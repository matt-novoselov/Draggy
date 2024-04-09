//
//  SFSymbolsPicker.swift
//  SwiftNode
//
//  Created by Matt Novoselov on 09/04/24.
//

import SwiftUI

struct SFSymbolsPicker: View {
    
    @State private var searchText = ""
    @Binding var selectedSymbol: String
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        
        NavigationStack {
            ScrollView {
                
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(getSFSymbolsContaining(searchText), id: \.self) { symbol in
                        symbolButton(symbol: symbol, selectedSymbol: $selectedSymbol)
                    }
                }
                .padding()
                
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

struct symbolButton: View {
    
    var symbol: String
    @Binding var selectedSymbol: String
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        
        Button(
            action: {
                selectedSymbol = symbol
                
                dismiss()
            }
        )
        {

            Group{
                Image(systemName: "circle")
                    .opacity(0)
                    .padding()
                    .background{
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
