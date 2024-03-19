//
//  TextNode.swift
//  test_gragndrop
//
//  Created by Matt Novoselov on 18/03/24.
//

import SwiftUI

struct TextNode: View {
    @Binding var circlePosition: CGPoint
    @Binding var diplayedText: String
    var action: (() -> Void)?
    
    var body: some View {
        let circleSize: CGFloat = 200
        
        GeometryReader { geometry in
            ZStack{
                RoundedRectangle(cornerRadius: 20)
                
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.white, lineWidth: 5)
                
                VStack{
                    Text("Text Node")
                        .fontWeight(.bold)
                        .foregroundStyle(.white)

                    TextField("Placeholder", text: $diplayedText)
                        .foregroundStyle(.white)
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
