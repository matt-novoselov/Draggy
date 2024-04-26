//
//  SwiftUIView.swift
//  Draggy
//
//  Created by Matt Novoselov on 18/03/24.
//

import SwiftUI

// Static Bezier Path is displayed in the background of the path and cannot be interacted with
struct BezierPathStatic: View {
    
    // Represents the first selected node
    var selectedNode1: Node
    
    // Represents the second selected node
    var selectedNode2: Node
    
    // Calculate the control point for the curve
    private var controlPoint1: CGPoint {
        return CGPoint(x: (startPoint.x + endPoint.x) / 2, y: startPoint.y)
    }
    
    // Calculate the control point for the curve
    private var controlPoint2: CGPoint {
        return CGPoint(x: (startPoint.x + endPoint.x) / 2, y: endPoint.y)
    }
    
    // Calculate the start point of the curve
    private var startPoint: CGPoint {
        return CGPoint(x: selectedNode1.position.x + 100, y: selectedNode1.position.y)
    }
    
    // Calculate the end point of the curve
    private var endPoint: CGPoint {
        return CGPoint(x: selectedNode2.position.x + 100, y: selectedNode2.position.y)
    }
    
    var body: some View {
        ZStack {
            // Draw the curve
            Path { (path) in
                path.move(to: startPoint)
                path.addCurve(to: endPoint, control1: controlPoint1, control2: controlPoint2)
            }
            .strokedPath(StrokeStyle(lineWidth: 9, lineCap: .round, lineJoin: .round))
            .foregroundStyle(Color.accentColor)
            
            // Circle 1 representing the start point
            Circle()
                .frame(width: 32, height: 32)
                .position(startPoint)
                .foregroundStyle(.nodeConnectionDark)
            
            // Circle 2 representing the end point
            Circle()
                .frame(width: 32, height: 32)
                .position(endPoint)
                .foregroundStyle(Color.accentColor)
        }
        // Disable hit testing for the whole view
        .allowsHitTesting(false)
    }
}

