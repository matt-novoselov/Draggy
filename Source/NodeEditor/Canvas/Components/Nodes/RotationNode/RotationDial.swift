//
//  Rotating Dial.swift
//
//  Created by Ryan on 3/18/22.
//  Based on https://stackoverflow.com/questions/67258304/make-finite-circleslider-swiftui

import SwiftUI
import GLKit

struct RotatingDial: View {
    
    //MARK: - Configurable properties
    var lineThickness:LineThickness = .max
    var indicatorDiameter = 50.0
    var lineWidth:Double {
        return indicatorDiameter * lineThickness.rawValue
    }
    var circleSizeMultiplier = 4
    var scaledCircleSize: Double {
        let manualScaling = indicatorDiameter * Double(circleSizeMultiplier)
        let boundingScaling = UIScreen.main.bounds.width - 100
        return min(manualScaling, boundingScaling)
    }
    
    ///A forced size for the dial specified by the caller
    var dialSize: Double?
    
    var intendedDialSize: Double {
       dialSize ?? scaledCircleSize
    }
    
    var canRotateLessThan0 = false
    var canRotateMoreThan360 = false
    var showProgress = true
    
    //MARK: - Internal State
    @Binding var angle: Double
    @State var progress: Double = .zero
    @State var currentQuadrant:Quadrant = .one
    @State var upcomingQuadrant:Quadrant = .one
    
    //MARK: - View
    var body: some View {
        VStack {
            Spacer()
            ZStack {
                dialOutline
                if showProgress {
                    currentProgressFill
                }
                angleIndicator
            }
            Spacer()
        }
        .onAppear(){
            progress = angle / 360.0
        }
    }
    
    func onDrag(value: DragGesture.Value) {
        currentQuadrant = upcomingQuadrant
        let dx = value.location.x
        let dy = value.location.y
        
        //Atan2 at the edge of the line, removing the radius of the indicator line and atan2 will give from -180 to 180
        let radians = atan2(dy - (0.5 * indicatorDiameter),
                            dx - (0.5 * indicatorDiameter))
        
        var dragAngle = Double(GLKMathRadiansToDegrees(Float(radians)))
        
        // simple technique for 0 to 360... eg = 360 - 176 = 184..
        if dragAngle < 0 {
            dragAngle = 360 + dragAngle
        }
        
        let futureQuadrant = quadrant(x: Sign.of(dx), atan2: Sign.of(radians))
        
        if shouldSnapTo0(from: currentQuadrant, to: futureQuadrant) {
            setAngleOfIndicator(to: 0)
        } else if shouldSnapTo360(from: currentQuadrant, to: futureQuadrant) {
            setAngleOfIndicator(to: 360)
        } else if dragAngle <=  360 {
            self.upcomingQuadrant = futureQuadrant
            setAngleOfIndicator(to: dragAngle)
        }
    }
}

//MARK: - Supporting Views
extension RotatingDial {
    
    ///The gray outline for the dial. This will have a thickness of `lineWidth` and a
    ///frame that encapsulates `circleSize`
    var dialOutline: some View {
        Circle()
            .stroke(Color.nodeStroke,
                    style: StrokeStyle(lineWidth: lineWidth,
                                       lineCap: .round,
                                       lineJoin: .round))
            .opacity(0.5)
            .frame(width: intendedDialSize, height: intendedDialSize)
    }
    
    ///The green fill representing the current progress.
    var currentProgressFill: some View {
        Circle()
            .trim(from: 0, to: progress)
            .stroke(Color.secondary,
                    style: StrokeStyle(lineWidth: lineWidth, lineCap: .round))
            .frame(width: intendedDialSize, height: intendedDialSize)
            .rotationEffect(.init(degrees: -90))
    }
    
    /// The circle representing the angle that is currently chosen. It will have a frame
    /// encapsulating `indicatorDiameter` and starts at the `angle` with 0º
    /// indicated at the top.
    var angleIndicator: some View {
        Circle()
            .fill(.nodeBackground)
            .overlay{
                Circle()
                    .fill(.clear)
                    .strokeBorder(.nodeStroke, lineWidth: 4)
            }
            .frame(width: indicatorDiameter, height: indicatorDiameter)
            .offset(x: intendedDialSize / 2) //put indicator circle on the edge
            .rotationEffect(.init(degrees: progress*360))//modification for it to rotate angle chosen
            .gesture(DragGesture().onChanged(onDrag(value:)))
            .rotationEffect(.init(degrees: -90)) //Offset the indicator to compensate for initial SwiftUI coordinate drift
    }
}

//MARK: - Supporting Types
extension RotatingDial {
    
    ///Supporting type to represent the sign of a number.
    ///Helps with pattern matching and exhaustive switches
    enum Sign {
        case positive, negative
        
        ///Positive is defined as >= 0.
        static func of(_ num:Double) -> Sign {
            if num >= 0 {
                return positive
            }
            else {
                return negative
            }
        }
    }
    
    ///A standardized thickness of the line drawn
    enum LineThickness:Double {
        case veryThin = 0.1,
             thin = 0.3,
             regular = 0.5,
             thick = 0.7,
             max = 1.0
    }
    
    ///Quadrants of a circle
    enum Quadrant:Int {
        case one = 1, two, three, four
    }
}

//MARK: - Supporting methods
extension RotatingDial {
    
    ///Reveals the quadrant of a circle from an x coordinate and atan2
    func quadrant(x:Sign, atan2:Sign) -> Quadrant {
        switch (x, atan2) {
        case (.positive, .positive):
            return .one
        case (.negative, .positive):
            return .two
        case (.negative, .negative):
            return .three
        case (.positive, .negative):
            return .four
        }
    }
    
    /// Sets the angle and progress, only allowing values that can be divided by 90.
    func setAngleOfIndicator(to angle: Double) {
        // Ensure the angle is within the range of 0 to 360 degrees
        let normalizedAngle = (angle >= 0) ? angle : angle + 360.0
        let roundedAngle = (normalizedAngle / 90.0).rounded() * 90.0

        // Update the angle
        withAnimation{
            self.angle = roundedAngle
        }
        
        withAnimation{
            self.progress = roundedAngle / 360.0
        }
    }

    
    ///Whether or not this dial should stop at and snap to 360º
    func shouldSnapTo360(from currentQuadrant:Quadrant,
                         to upcomingQuadrant:Quadrant) -> Bool {
        !canRotateMoreThan360 && //configuration
        currentQuadrant == .four && upcomingQuadrant == .one && // in the correct Quadrant?
        progress > 0.8 //Make sure we don't snap too soon
    }
    
    ///Whether or not this dial should stop at and snap to 0º
    func shouldSnapTo0(from currentQuadrant:Quadrant,
                       to upcomingQuadrant:Quadrant) -> Bool {
        !canRotateLessThan0 && //configuration
        currentQuadrant == .one && upcomingQuadrant == .four && // in the correct Quadrant?
        progress < 0.2 //Make sure we don't snap too soon
    }
}

extension Color {
    static let systemBackground = Color(UIColor.systemBackground)
    static let secondarySystemBackground = Color(UIColor.secondarySystemBackground)
    static let tertiarySystemBackground = Color(UIColor.tertiarySystemBackground)
    static let systemFill = Color(UIColor.systemFill)
}
