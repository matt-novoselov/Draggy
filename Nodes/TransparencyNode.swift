//
//  TransparencyNode.swift
//  SwiftUINodeEditor
//
//  Created by Matt Novoselov on 19/03/24.
//

import SwiftUI

struct TransparencyNode: View {
    @Binding var circlePosition: CGPoint
    @Binding var diplayedTransparency: Double
    var action: (() -> Void)?
    
    var body: some View {
        let circleSize: CGFloat = 200
        
        GeometryReader { geometry in
            ZStack{
                RoundedRectangle(cornerRadius: 20)
                
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.white, lineWidth: 5)
                
                VStack{
                    HStack{
                        Text("Transpareny Node \(diplayedTransparency.description)")
                            .fontWeight(.bold)
                            .foregroundStyle(.white)

                        Image(systemName: "rectangle.checkered")
                    }
                    
                    
                    Slider(value: $diplayedTransparency)
                }


            }
            .contextMenu(ContextMenu(menuItems: {
                Button("Delete"){
                    action?()
                }
            }))
            .position(circlePosition)
            .gesture(
                DragGesture()
                    .onChanged { value in
                        circlePosition = value.location
                    }
            )
        }
        .frame(width: circleSize, height: circleSize)
    }
}
