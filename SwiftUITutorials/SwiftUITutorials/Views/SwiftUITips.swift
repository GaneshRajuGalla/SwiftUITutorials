//
//  SwiftUITipsView.swift
//  SwiftUITutorials
//
//  Created by Ganesh Raju Galla on 19/05/24.
//

import SwiftUI

struct SwiftUITips: View {
    var body: some View {
        NavigationStack {
            //multicolorImage()
            containerRelativeFrame()
        }
    }
}

extension SwiftUITips {
    
    @ViewBuilder
    private func multicolorImage() -> some View {
        Image(systemName: "sun.max.trianglebadge.exclamationmark.fill")
            .resizable()
            .scaledToFit()
            .frame(width: 100, height: 100)
            .foregroundStyle(.yellow, .pink)
    }
    
    @ViewBuilder
    private func containerRelativeFrame() -> some View {
        VStack {
            Text("25%")
                .padding()
                .containerRelativeFrame(.horizontal) { length, _ in
                    return length * 0.25
                }
                .background{
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .fill(Color.pink)
                }
            Text("50%")
                .padding()
                .containerRelativeFrame(.horizontal) { length, _ in
                    return length * 0.5
                }
                .background {
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .fill(Color.cyan)
                }
            Text("75%")
                .padding()
                .containerRelativeFrame(.horizontal) { length, _ in
                    return length * 0.75
                }
                .background {
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .fill(Color.gray)
                }
            Text("100%")
                .padding()
                .containerRelativeFrame(.horizontal) { length, _ in
                    return length * 1.0
                }
                .background {
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .fill(Color.indigo)
                }
        }
        .font(.title)
        .fontWeight(.heavy)
        .foregroundStyle(Color.white)
    }
}

struct ContentView: View {
    
    // MARK: - Properties
    @State private var color:Color = .red
    
    // MARK: - Body
    var body: some View {
        let _ = Self._printChanges()
        
//        ZStack {
//            color
//                .ignoresSafeArea()
//            Button(action: {
//                self.color = Color(uiColor: UIColor(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1), alpha: 1.0))
//            }, label: {
//                Text("Change Color")
//                    .bold()
//                    .foregroundStyle(Color.black)
//                    .padding()
//                    .background {
//                        RoundedRectangle(cornerRadius: 20, style: .continuous)
//                            .fill(Color.white)
//                    }
//            })
//        }
        Image(systemName: "figure.run.circle.fill")
            .font(.system(size: 300))
            .layerEffect(ShaderLibrary.layerShader(.float(10)), maxSampleOffset: .zero)
    }
}

#Preview {
    ContentView()
}

//#Preview {
//    SwiftUITips()
//}
