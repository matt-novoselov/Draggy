//
//  SwiftUIView.swift
//  Draggy
//
//  Created by Matt Novoselov on 18/03/24.
//

import SwiftUI

// Interactive Bezier Path is displayed on the top of the nodes and can be used (dragged) to link nodes between each other
struct BezierPathInteractive: View {
    
    // Load NodeData from Environment
    @Environment(NodeData.self)
    private var nodeData: NodeData
    
    // Load NotificationsData from Environment
    @Environment(NotificationsData.self)
    private var notificationsData: NotificationsData
    
    // Represents the node associated with this BezierPathInteractive
    var selfNode: Node
    
    // State variables to track start and end points of the curve
    @State private var startPoint: CGPoint = CGPoint(x: 100, y: 100)
    @State private var endPoint: CGPoint = CGPoint(x: 100, y: 100)
    
    // Computed properties for control points of the curve
    private var controlPoint1: CGPoint {
        return CGPoint(x: (startPoint.x + endPoint.x) / 2, y: startPoint.y)
    }
    
    private var controlPoint2: CGPoint {
        return CGPoint(x: (startPoint.x + endPoint.x) / 2, y: endPoint.y)
    }
    
    // State variable to keep track of the last checked node ID
    @State var lastCheckedNodeID: UUID = .init()
    
    var body: some View {
        ZStack {
            // Drawing the Bezier path curve
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
                .foregroundStyle(Color.accentColor)
            
            // Circle 2 representing the end point
            Circle()
                .frame(width: 32, height: 32)
                .position(endPoint)
                .foregroundStyle(.nodeConnectionDark)
                .gesture(
                    DragGesture()
                        .onChanged { (value) in
                            // Update end point based on drag gesture
                            self.endPoint = CGPoint(x: value.location.x, y: value.location.y)
                            
                            // Detect overlapping circles during drag
                            detectOverlappingCircle(value: value)
                        }
                        .onEnded(){ _ in
                            // Snap back to start point after drag ends
                            withAnimation{
                                self.endPoint = self.startPoint
                            }
                        }
                )
        }
    }
    
    // Function to detect overlapping circles during drag
    func detectOverlappingCircle(value: DragGesture.Value) {
        let colliderSize: Double = 20
        
        // Iterate through all nodes in nodeData
        for node in nodeData.nodes {
            let circlePosition = node.position
            
            // Calculate distance between current node and drag point
            let distance = sqrt(
                pow(circlePosition.x - selfNode.position.x - value.location.x + 100, 2) +
                pow(circlePosition.y - selfNode.position.y - value.location.y + 100, 2)
            )
            
            // If distance is within collider size, attempt to link nodes
            if distance <= colliderSize {
                // Prevent multiple link attempts for the same node
                guard node.id != lastCheckedNodeID else{
                    return
                }
                
                // Attempt to link nodes and update lastCheckedNodeID
                node.tryToLinkNode(selfNode, notificationsData: notificationsData)
                lastCheckedNodeID = node.id
                return
            }
        }
    }
    
}
