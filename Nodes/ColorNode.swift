//
//  ColorNode.swift
//  test_gragndrop
//
//  Created by Matt Novoselov on 18/03/24.
//

import SwiftUI

struct ColorNode: View {
    @Binding var circlePosition: CGPoint
    @Binding var diplayedColor: Color
    
    var body: some View {
        let circleSize: CGFloat = 200
        
        GeometryReader { geometry in
            ZStack{
                RoundedRectangle(cornerRadius: 20)
                
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.white, lineWidth: 5)
                
                VStack{
                    Text("Color Node")
                        .fontWeight(.bold)
                        .foregroundStyle(.white)

                    ColorPicker("Pick", selection: $diplayedColor)
                        .foregroundStyle(.white)
                }

            }
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
