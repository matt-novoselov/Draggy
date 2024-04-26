//
//  ExcitButtonView.swift
//  Roommates
//
//  Created by Suyeon Cho on 19/02/24.
//

import SwiftUI

// Native Looking button to close the sheet
struct ExitButtonView: View {

    @Environment(\.dismiss) var dismiss

    var body: some View {
        
        Button(action: {dismiss()}) {
            
            Image(systemName: "xmark")
                .imageScale(.small)
                .fontWeight(.semibold)
                .foregroundStyle(.secondary)
                .padding(8)
                .background(.gray.tertiary, in: .circle)
                .accessibility(label: Text("Close"))
            
        }
        .buttonStyle(PlainButtonStyle())

    }
}
