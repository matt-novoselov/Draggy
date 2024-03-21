//
//  SwiftUIView.swift
//  test_gragndrop
//
//  Created by Matt Novoselov on 18/03/24.
//

import SwiftUI

struct BezierPath: View {
    var selectedNode1: any Node
    var selectedNode2: any Node
    
    private var controlPoint1: CGPoint {
        return CGPoint(x: (startPoint.x + endPoint.x) / 2, y: startPoint.y)
    }
    
    private var controlPoint2: CGPoint {
        return CGPoint(x: (startPoint.x + endPoint.x) / 2, y: endPoint.y)
    }
    
    private var startPoint: CGPoint {
        return selectedNode1.position
    }
    
    private var endPoint: CGPoint {
        return selectedNode2.position
    }
    
    var body: some View {
        ZStack {
            Path { (path) in
                path.move(to: startPoint)
                path.addCurve(to: endPoint, control1: controlPoint1, control2: controlPoint2)
            }
            .strokedPath(StrokeStyle(lineWidth: 9, lineCap: .round, lineJoin: .round))
            .foregroundColor(.green)
            
            // Circle 1
            Circle()
                .frame(width: 32, height: 32)
                .position(startPoint)
                .foregroundColor(.blue)
            
            // Circle 2
            Circle()
                .frame(width: 32, height: 32)
                .position(endPoint)
                .foregroundColor(.green)
        }
        .allowsHitTesting(false)
    }
}
