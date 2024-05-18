//
//  HeartAnimation.swift
//  SwiftUITutorials
//
//  Created by Ganesh Raju Galla on 18/05/24.
//

import SwiftUI

struct HeartAnimation: View {
    
    // MARK: - Properties
    @State private var to:CGFloat = 0
    
    // MARK: - Body
    var body: some View {
        HeartShape()
            .trim(from: 0, to: to)
            .stroke(Color.pink, style: StrokeStyle(lineWidth: 5, lineCap: .round))
            .frame(width: 110, height: 110)
            .onAppear {
                withAnimation(
                    Animation
                        .easeInOut(duration: 0.7)
                        .repeatForever(autoreverses: false)) {
                            to = 1
                        }
            }
    }
}





struct HeartShape: Shape {
    let minX = 10
    let centerX = 55
    let maxX = 100
    let minY = 10
    let maxY = 100
    
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: centerX, y: maxY))
            path.addQuadCurve(to: CGPoint(x: minX, y: 50), control: CGPoint(x: minX, y: 70))
            path.addQuadCurve(to: CGPoint(x: centerX, y: 30), control: CGPoint(x: minX, y: minY))
            path.addQuadCurve(to: CGPoint(x: maxX, y: 50), control: CGPoint(x: maxX, y: minY))
            path.addQuadCurve(to: CGPoint(x: centerX, y: maxY), control: CGPoint(x: maxX, y: 70))
            path.closeSubpath()
        }
    }
}

#Preview {
    HeartAnimation()
}
