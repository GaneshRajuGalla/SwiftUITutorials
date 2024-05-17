//
//  ContentView.swift
//  ChartExample
//
//  Created by Ganesh Raju Galla on 12/03/24.
//

import SwiftUI
import CheesyChart

struct ContentView: View {
    /// You need a @State var if you want to use the tapPoint to show the current price of the stock or coin in a extra TextView
    @State var value: Int? = 0
    @StateObject private var viewModel = ViewModel()

    let setup = SetupChart(
               name: "Ganesh",
               data: loadExistingGoldPriceDataFromJSON()?.compactMap({$0.value}) ?? [],
               image: UIImage(named: "Image"),
               chartHeight: 250,
               animateChart: true,
               chartBackground: .cb5,
               chartBackgroundColor: Color(UIColor.systemGroupedBackground).opacity(0.3),
               showYAxiesStats: true,
               yAxiesStatsColor: .black,
               showShadow1: true,
               showShadow2: true,
               chartPriceLabelColor: Color(UIColor.systemGroupedBackground).opacity(0.3),
               chartPriceLabelFontColor: .black
           )
    
    var body: some View {
        CheesyChart(setup: setup, tapPoint: $value)
    }
    
    private func loadExistingGoldPriceDataFromJSON() -> [GoldPriceResponse]? {
        guard let url = Bundle.main.url(forResource: "OuncesMetalsUSD", withExtension: "json") else {
            print("JSON file not found")
            return nil
        }
        
        do {
            let data = try Data(contentsOf: url)
            let existingData = try JSONDecoder().decode([GoldPriceResponse].self, from: data)
            return existingData
        } catch {
            print("Error decoding JSON:", error)
            return nil
        }
    }
}

#Preview {
    ContentView()
}
