//
//  ViewModel.swift
//  ChartExample
//
//  Created by Ganesh Raju Galla on 12/03/24.
//

import Foundation

class ViewModel : ObservableObject {
    
    @Published var goldPriceData:[GoldPriceResponse] = []
    
    init() {
        if let goldPriceData = loadExistingGoldPriceDataFromJSON() {
            self.goldPriceData = goldPriceData
        }
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
