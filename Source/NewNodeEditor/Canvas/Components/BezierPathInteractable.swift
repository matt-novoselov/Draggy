//
//  SwiftUIView.swift
//  test_gragndrop
//
//  Created by Matt Novoselov on 18/03/24.
//

import SwiftUI

struct BezierPathInteractable: View {
    
    @Environment(NodeData.self)
    private var nodeData: NodeData
    
    @Environment(NotificationsData.self)
    private var notificationsData: NotificationsData
    
    var selfNode: Node
    
    @State private var startPoint: CGPoint = CGPoint(x: 100, y: 100)
    @State private var endPoint: CGPoint = CGPoint(x: 100, y: 100)
    
    private var controlPoint1: CGPoint {
        return CGPoint(x: (startPoint.x + endPoint.x) / 2, y: startPoint.y)
    }
    
    private var controlPoint2: CGPoint {
        return CGPoint(x: (startPoint.x + endPoint.x) / 2, y: endPoint.y)
    }
    
    @State var lastCheckedNodeID: UUID = .init()
    
    var body: some View {        
        ZStack {
            Path { (path) in
                path.move(to: startPoint)
                path.addCurve(to: endPoint, control1: controlPoint1, control2: controlPoint2)
            }
            .strokedPath(StrokeStyle(lineWidth: 9, lineCap: .round, lineJoin: .round))
            .foregroundStyle(Color.accentColor)

            
            // Circle 1
            Circle()
                .frame(width: 32, height: 32)
                .position(startPoint)
                .foregroundColor(.accentColor)
            
            // Circle 2
            Circle()
                .frame(width: 32, height: 32)
                .position(endPoint)
                .foregroundColor(.nodeConnectionDark)
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
        let colliderSize: Double = 20

        for node in nodeData.nodes {
            let circlePosition = node.position
            
            let distance = sqrt(
                pow(circlePosition.x - selfNode.position.x - value.location.x + 100, 2) +
                pow(circlePosition.y - selfNode.position.y - value.location.y + 100, 2)
            )
            
            if distance <= colliderSize {
                guard node.id != lastCheckedNodeID else{
                    return
                }
                
                node.tryToLinkNode(selfNode, notificationsData: notificationsData)
                lastCheckedNodeID = node.id
                return
            }
        }
    }
    
}
