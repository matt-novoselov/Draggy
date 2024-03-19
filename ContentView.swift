//
//  NewContentView.swift
//  test_gragndrop
//
//  Created by Matt Novoselov on 18/03/24.
//

import SwiftUI

struct ContentView: View {
    @State var toggleStates: [Bool] = []
    @State var toggleNodePosition: [CGPoint] = []
    
    @State var textStates: [String] = []
    @State var textNodePositions: [CGPoint] = []

    @State var colorStates: [Color] = []
    @State var colorNodePositions: [CGPoint] = []
    
    @State private var currentZoom = 0.0
    @State private var currentPos: CGPoint = .zero
    @State private var totalZoom = 1.0
    
    var body: some View {
        NavigationSplitView{
            
            ScrollView{
                VStack{
                    ForEach(0..<textStates.count, id: \.self) { index in
                        Text(textStates[index])
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundStyle(colorStates.indices.contains(index) ? colorStates[index] : .white)
                        
                    }
                    
                    ForEach(0..<toggleStates.count, id: \.self) { index in
                        Toggle("Toggle \(index + 1)", isOn: self.$toggleStates[index])
                            .foregroundColor(.white)
                    }
                    
                }
                
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.black)

            
        }
        detail: {
            VStack{
                HStack(spacing: 50) {
                    Button("Add Text") {
                        addText()
                    }
                    
                    Button("Add Color") {
                        addColor()
                    }
                    
                    Button("Add Toggle") {
                        addToggle()
                    }
                }
                
                ZStack{
                    ForEach(0..<colorStates.count, id: \.self) { index in
                        ColorNode(circlePosition: $colorNodePositions[index], diplayedColor: $colorStates[index])
                            .background {
                                if textNodePositions.indices.contains(index) && colorNodePositions.indices.contains(index) {
                                    BezierPath(startPoint: $colorNodePositions[index], endPoint: $textNodePositions[index])
                                }
                            }
                    }
                    
                    ForEach(0..<textStates.count, id: \.self) { index in
                        TextNode(circlePosition: $textNodePositions[index], diplayedText: $textStates[index], action: {removeText(at: index)})
                    }
                    
                    ForEach(0..<toggleStates.count, id: \.self) { index in
                        ToggleNode(circlePosition: $toggleNodePosition[index], isOn: $toggleStates[index], action: {removeToggle(at: index)})
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(.green)
                .position(currentPos)
                .scaleEffect(currentZoom + totalZoom)
                .gesture(
                    MagnifyGesture()
                        .onChanged { value in
                            currentZoom = value.magnification - 1
                        }
                        .onEnded { value in
                            totalZoom += currentZoom
                            currentZoom = 0
                        }
                        .simultaneously(with:
                                            DragGesture()
                            .onChanged { value in
                                currentPos = value.location
                            }
                )
                     )
                .background(.gray)
                
                
            }
        }
        
    }
    
    func addToggle() {
        withAnimation(.easeInOut){
            toggleStates.append(false)
            toggleNodePosition.append(.zero)
        }
    }
    
    func removeToggle(at index: Int) {
        withAnimation(.easeInOut){
            toggleStates.remove(at: index)
            toggleNodePosition.remove(at: index)
        }
    }
    
    func addText() {
        withAnimation(.easeInOut){
            textStates.append("Placeholder")
            textNodePositions.append(.zero)
        }
    }
    
    func removeText(at index: Int) {
        withAnimation(.easeInOut){
            textStates.remove(at: index)
            textNodePositions.remove(at: index)
        }
    }
    
    func addColor() {
        withAnimation(.easeInOut){
            colorStates.append(.white)
            colorNodePositions.append(.zero)
        }
    }
    
    func removeColor(at index: Int) {
        withAnimation(.easeInOut){
            colorStates.remove(at: index)
            colorNodePositions.remove(at: index)
        }
    }
}

#Preview {
    ContentView()
}
