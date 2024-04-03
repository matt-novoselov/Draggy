//
//  SliderView2.swift
//  SwiftUI-Node-Editor
//
//  Created by Matt Novoselov on 03/04/24.
//

import SwiftUI

struct OpacitySlider: View {
    @Binding var value: Double
    
    @State var lastCoordinateValue: CGFloat = 0.0
    var sliderRange: ClosedRange<Double> = 0...1
    
    var body: some View {
        GeometryReader { gr in
            let thumbSize = gr.size.height * 0.8
            let radius = gr.size.height * 0.5
            let minValue = 0.0
            let maxValue = gr.size.width - thumbSize
            
            let scaleFactor = (maxValue - minValue) / (sliderRange.upperBound - sliderRange.lowerBound)
            let lower = sliderRange.lowerBound
            let sliderVal = (self.value - lower) * scaleFactor + minValue
            
            ZStack {
                Rectangle ()
                    .fill(.clear)
                    .overlay{
                        ZStack{
                            
                            LinearGradient(gradient: Gradient(colors: [.white.opacity(0), .white]), startPoint: .leading, endPoint: .trailing)
                            
                            Image(.checkers)
                                .resizable()
                                .scaledToFill()
                                .opacity(0.2)

                        }
                    }
                    .cornerRadius(radius)
                
                HStack {
                    Circle()
                        .fill(.nodeBackground)
                        .overlay{
                            Circle()
                                .fill(.clear)
                                .strokeBorder(.nodeStroke, lineWidth: 4)
                        }
                        .offset(x: sliderVal)
                        .gesture(
                            DragGesture(minimumDistance: 0)
                                .onChanged { v in
                                    if (abs(v.translation.width) < 0.1) {
                                        self.lastCoordinateValue = sliderVal
                                    }
                                    if v.translation.width > 0 {
                                        let nextCoordinateValue = min(maxValue, self.lastCoordinateValue + v.translation.width)
                                        self.value = ((nextCoordinateValue - minValue) / scaleFactor)  + lower
                                    } else {
                                        let nextCoordinateValue = max(minValue, self.lastCoordinateValue + v.translation.width)
                                        self.value = ((nextCoordinateValue - minValue) / scaleFactor) + lower
                                    }
                                    
                                }
                        )
                    Spacer()
                }
            }
        }
    }
}
