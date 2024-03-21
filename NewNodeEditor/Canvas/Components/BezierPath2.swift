//
//  SwiftUIView.swift
//  test_gragndrop
//
//  Created by Matt Novoselov on 18/03/24.
//

import SwiftUI

struct BezierPath2: View {
    @EnvironmentObject var nodeData: NodeData
    var selfNode: any Node
    
    @State private var startPoint: CGPoint = .zero
    @State private var endPoint: CGPoint = .zero
    
    private var controlPoint1: CGPoint {
        return CGPoint(x: (startPoint.x + endPoint.x) / 2, y: startPoint.y)
    }
    
    private var controlPoint2: CGPoint {
        return CGPoint(x: (startPoint.x + endPoint.x) / 2, y: endPoint.y)
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
                .gesture(DragGesture()
                    .onChanged { (value) in
                        self.endPoint = CGPoint(x: value.location.x, y: value.location.y)
                        
                        detectOverlappingCircle(value: value)
                    }
                    .onEnded(){ _ in
                        withAnimation{
                            self.endPoint = self.startPoint
                        }
                    }
                )
        }
    }
    
    func detectOverlappingCircle(value: DragGesture.Value) {
        
        for index in 0..<nodeData.textNodes.count {
            let circlePosition = nodeData.textNodes[index].position
            
            
            let distance = sqrt(pow(circlePosition.x - selfNode.position.x - value.location.x, 2) + pow(circlePosition.y - selfNode.position.y - value.location.y, 2))
            if distance <= 100 {
                nodeData.textNodes[index].addLinkedNode(selfNode)
                return
            }
        }
        
        for index in 0..<nodeData.imageNodes.count {
            let circlePosition = nodeData.imageNodes[index].position
            
            
            let distance = sqrt(pow(circlePosition.x - selfNode.position.x - value.location.x, 2) + pow(circlePosition.y - selfNode.position.y - value.location.y, 2))
            if distance <= 100 {
                nodeData.imageNodes[index].addLinkedNode(selfNode)
                return
            }
        }
        
        
    }
}
