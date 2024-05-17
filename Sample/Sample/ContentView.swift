//
//  ContentView.swift
//  Sample
//
//  Created by Ganesh Raju Galla on 12/03/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
           
            let date = Date()
            let formattedDate = date.removeTimeStamp?.toString(withFormat: "YY/MM/dd")
        }
        .padding()
    }
}

extension Date {
    public var removeTimeStamp : Date? {
       guard let date = Calendar.current.date(from: Calendar.current.dateComponents([.year, .month, .day], from: self)) else {
        return nil
       }
       return date
   }
    
    func toString(withFormat format: String) -> String {
           let dateFormatter = DateFormatter()
           dateFormatter.dateFormat = format
           return dateFormatter.string(from: self)
       }
}

#Preview {
    ContentView()
}
