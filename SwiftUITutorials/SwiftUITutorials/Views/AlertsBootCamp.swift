//
//  AlertsBootCamp.swift
//  SwiftUITutorials
//
//  Created by Ganesh Raju Galla on 18/05/24.
//

import SwiftUI

struct AlertsBootCamp: View {
    
    // MARK: - Properties
    @State private var isShowAlert:Bool = false
    
    // MARK: - Body
    var body: some View {
        Button(action: {
           isShowAlert = true
        }, label: {
            Text("Display Alert")
                .font(.headline)
                .fontWeight(.bold)
                .foregroundStyle(.white)
                .padding()
                .background(content: {
                    RoundedRectangle(cornerRadius: 25.0, style: .continuous)
                        .foregroundStyle(Color.black)
                })
        })
        .alert("Title", isPresented: $isShowAlert) {
            // Single Button
//            Button("Presse Me") {
//                // action when button pressed
//            }
            
            // Multiple Buttons
//            Button("Button 1") {
//                // button 1 actions will come here
//            }
//            
//            Button("Button 2") {
//                // button action will come here
//            }
//            
//            Button("Button 3") {
//                // button 3 actions will come here
//            }
            
            Button("Delete", role: .destructive) {
                // actione will come here
            }
        } message: {
            Text("Message")
        }
    }
}

struct ContentView: View {
    
    // MARK: - Properties
    @State private var isShowAlert1:Bool = false
    @State private var isShowAlert2:Bool = false
    
    // MARK: - Body
    var body: some View {
        VStack {
            Button("Alert 1 display") { isShowAlert1 = true }
            Button("Alert 2 display") { isShowAlert2 = true }
        }
        .alert("Alert 1", isPresented: $isShowAlert1) { }
        .alert("Alert 2", isPresented: $isShowAlert2) { }
    }
}

#if DEBUG
#Preview {
    //AlertsBootCamp()
    ContentView()
}
#endif
