//
//  SliderView2.swift
//  Draggy
//
//  Created by Matt Novoselov on 03/04/24.
//

import SwiftUI

struct OpacitySlider: View {
    @Binding var value: Double // Binding for the slider's value
    
    @State var lastCoordinateValue: CGFloat = 0.0 // Keeps track of the last coordinate value
    var sliderRange: ClosedRange<Double> = 0...1 // Range of the slider's values
    
    var body: some View {
        GeometryReader { gr in // GeometryReader to get the size of the parent view
            let thumbSize = gr.size.height * 0.8 // Size of the slider's thumb
            let radius = gr.size.height * 0.5 // Radius for rounding corners
            let minValue = 0.0 // Minimum value for the slider
            let maxValue = gr.size.width - thumbSize // Maximum value for the slider
            
            // Calculate the scale factor to convert slider values to coordinates
            let scaleFactor = (maxValue - minValue) / (sliderRange.upperBound - sliderRange.lowerBound)
            let lower = sliderRange.lowerBound
            let sliderVal = (self.value - lower) * scaleFactor + minValue // Current slider value
            
            ZStack {
                // Background of the slider
                Rectangle ()
                    .fill(.clear)
                    .overlay{
                        ZStack{
                            // LinearGradient background
                            LinearGradient(gradient: Gradient(colors: [.white.opacity(0), .white]), startPoint: .leading, endPoint: .trailing)
                            
                            // Checkers pattern
                            Image(.checkers)
                                .resizable()
                                .scaledToFill()
                                .opacity(0.2)
                        }
                    }
                    .cornerRadius(radius) // Rounded corners for the background
                
                HStack {
                    // Slider thumb
                    Circle()
                        .fill(.nodeBackground)
                        .overlay{
                            Circle()
                                .fill(.clear)
                                .strokeBorder(.nodeStroke, lineWidth: 4) // Stroke around the thumb
                        }
                        .offset(x: sliderVal) // Position the thumb based on the current value
                        .gesture(
                            DragGesture(minimumDistance: 0)
                                .onChanged { v in
                                    if (abs(v.translation.width) < 0.1) {
                                        self.lastCoordinateValue = sliderVal // Update last coordinate value
                                    }
                                    // Update the slider value based on drag direction
                                    if v.translation.width > 0 {
                                        let nextCoordinateValue = min(maxValue, self.lastCoordinateValue + v.translation.width)
                                        self.value = ((nextCoordinateValue - minValue) / scaleFactor)  + lower
                                    } else {
                                        let nextCoordinateValue = max(minValue, self.lastCoordinateValue + v.translation.width)
                                        self.value = ((nextCoordinateValue - minValue) / scaleFactor) + lower
                                    }
                                }
                        )
                    Spacer() // Spacer to push the thumb to the left
                }
            }
        }
    }
}
