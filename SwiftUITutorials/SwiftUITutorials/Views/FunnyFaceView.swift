//
//  FunnyFaceView.swift
//  SwiftUITutorials
//
//  Created by Ganesh Raju Galla on 19/05/24.
//

import SwiftUI

struct FunnyFaceView: View {
    
    // MARK: - Properties
    @State private var isRotate: Bool = false
    @State private var rotationAngle: Double = 0
    
    // MARK: - Body
    var body: some View {
        ZStack {
            faceView()
            facePartsView()
        }
        .onAppear {
            withAnimation(Animation.linear(duration: 1).repeatForever(autoreverses: false)) {
                rotationAngle = 360
            }
        }
    }
}

extension FunnyFaceView {
    
    @ViewBuilder
    private func faceView() -> some View{
        Circle()
            .fill(Color.yellow)
            .frame(width: 300, height: 300)
    }
    
    @ViewBuilder
    private func facePartsView() -> some View {
        VStack {
            eyesView()
            mouthView()
        }
    }
    
    @ViewBuilder
    private func eyesView() -> some View {
        HStack {
            eyeView(offset: 10)
            eyeView(offset: -10)
        }
        .offset(y:-50)
    }
}

// MARK: - Helper Views
extension FunnyFaceView {
    @ViewBuilder
    private func eyeView(offset: CGFloat) -> some View {
        ZStack {
            Circle()
                .fill(Color.white)
                .frame(width: 50, height: 50)
            Circle()
                .fill(Color.black)
                .frame(width: 10, height: 10)
                .offset(x: offset)
                .rotationEffect(.degrees(rotationAngle))
        }
        .onAppear{
            isRotate.toggle()
        }
    }
    
    @ViewBuilder
    private func mouthView() -> some View {
        RoundedRectangle(cornerRadius: 20, style: .continuous)
            .fill(Color.white)
            .frame(width: 150, height: 20)
            .offset(y: 50)
    }
}

#if DEBUG
#Preview {
    FunnyFaceView()
}
#endif
