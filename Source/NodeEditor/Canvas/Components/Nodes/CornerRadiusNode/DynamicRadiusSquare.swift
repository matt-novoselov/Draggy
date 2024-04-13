//
//  DynamicRadiusSquare.swift
//  SwiftNode
//
//  Created by Matt Novoselov on 13/04/24.
//

import SwiftUI

struct DynamicRadiusSquare: View {
    
    @Binding var nodeValue: CGFloat
    let maxSliderValue: CGFloat
    
    @State private var geometryProxySize: CGSize = .zero
    
    private var maxCornerRadius: CGFloat{
        return min(geometryProxySize.width / 2, geometryProxySize.width / 4 * sqrt(2))
    }
    
    private var localCornerRadius: CGFloat {
        return (nodeValue * maxCornerRadius) / maxSliderValue
    }
    
    var body: some View {
        
        RoundedRectangle(cornerRadius: localCornerRadius)
            .fill(.clear)
            .stroke(.white, lineWidth: 8)
            .aspectRatio(contentMode: .fit)
            .padding()
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
