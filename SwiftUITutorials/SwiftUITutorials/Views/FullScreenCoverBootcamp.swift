//
//  FullScreenCoverBootcamp.swift
//  SwiftUITutorials
//
//  Created by Ganesh Raju Galla on 11/03/24.
//

import Foundation
import SwiftUI

struct FullScreenCoverBootcamp: View {
    
    // MARK: - Properties
    @State private var showModel:Bool = false
    
    // MARK: - Body
    var body: some View {
        Button("Open model screen") {
            showModel.toggle()
        }
        .fullScreenCover(isPresented: $showModel, content: {
            PresentingView()
                //.ignoresSafeArea()
        })
    }
}

struct PresentingView: View {
    
    // MARK: - Properties
    @Environment(\.dismiss) private var dismiss
    
    // MARK: - Body
    var body: some View {
        ZStack {
            Color.pink
                
            Button("Close Screen") {
                dismiss()
            }
            .foregroundStyle(Color.white)
        }
    }
}

#if DEBUG
#Preview {
    FullScreenCoverBootcamp()
}
#endif
