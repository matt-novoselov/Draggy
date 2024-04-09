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
        }
        .searchable(text: $searchText)

    }
}

struct singleSearchButton: View {
    
    var searchButton: ButtonItem
    
    var body: some View {
        
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
}

#Preview {
    SmartSearch()
}
