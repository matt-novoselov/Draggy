//
//  DynamicRadiusSquare.swift
//  Draggy
//
//  Created by Matt Novoselov on 13/04/24.
//

import SwiftUI

// The DynamicRadiusSquare represents an amount of radius for the selected node based on the math formula that automatically adjusts the size of corners based on the dimensions of the rectangle
struct DynamicRadiusSquare: View {
    
    // Binding to control the value of the node
    @Binding var nodeValue: CGFloat
    
    // Maximum value the slider can have
    let maxSliderValue: CGFloat
    
    // State variable to hold the size of the geometry proxy
    @State private var geometryProxySize: CGSize = .zero
    
    // Calculate the maximum corner radius based on the geometry proxy size
    private var maxCornerRadius: CGFloat{
        return min(geometryProxySize.width / 2, geometryProxySize.width / 4 * sqrt(2))
    }
    
    // Calculate the corner radius of the RoundedRectangle based on the node value
    private var localCornerRadius: CGFloat {
        return (nodeValue * maxCornerRadius) / maxSliderValue
    }
    
    var body: some View {
        // RoundedRectangle with dynamic corner radius
        RoundedRectangle(cornerRadius: localCornerRadius)
            .fill(.clear)
            .stroke(.white, lineWidth: 8)
            .aspectRatio(contentMode: .fit)
            .padding()
        
            // Overlay to read the size of the geometry proxy
            .overlay{
                GeometryReader{ proxy in
                    Color.clear
                        .onAppear(){
                            geometryProxySize = proxy.size
                        }
                }
            }
    }
}

