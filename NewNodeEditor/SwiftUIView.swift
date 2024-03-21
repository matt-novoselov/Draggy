import SwiftUI

struct SwiftUIView: View {
    @State private var dragPosition: CGPoint = .zero
    @State private var draggedCircleIndex: Int?
    
    let circleCount = 8
    let circleRadius: CGFloat = 50
    
    var body: some View {
        ZStack {
            ForEach(0..<circleCount, id: \.self) { index in
                Circle()
                    .foregroundColor(self.draggedCircleIndex == index ? .red : .blue)
                    .frame(width: self.circleRadius * 2, height: self.circleRadius * 2)
                    .position(self.position(for: index))
            }
        }
        .background(.gray)
        .gesture(
            DragGesture(minimumDistance: 0)
                .onChanged { value in
                    self.dragPosition = value.location
                    self.detectOverlappingCircle()
                }
                .onEnded { _ in
                    self.draggedCircleIndex = nil
                }
        )
    }
    
    func position(for index: Int) -> CGPoint {
        let angle = 2 * CGFloat.pi / CGFloat(circleCount) * CGFloat(index)
        let x = cos(angle) * 150 + 200
        let y = sin(angle) * 150 + 200
        return CGPoint(x: x, y: y)
    }
    
    func detectOverlappingCircle() {
        for index in 0..<circleCount {
            let circlePosition = position(for: index)
            let distance = sqrt(pow(circlePosition.x - dragPosition.x, 2) + pow(circlePosition.y - dragPosition.y, 2))
            if distance <= circleRadius {
                draggedCircleIndex = index
                return
            }
        }
        draggedCircleIndex = nil
    }
}

#Preview {
    SwiftUIView()
}
