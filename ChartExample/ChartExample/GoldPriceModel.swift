//
//  GoldPriceModel.swift
//  ChartExample
//
//  Created by Ganesh Raju Galla on 12/03/24.
//

import Foundation
import Foundation

// MARK: - GoldPriceResponse
struct GoldPriceResponse: Codable, Hashable {
    
    let date: Date?
    let value: Double?
    
    enum CodingKeys: String, CodingKey {
        case date = "Date"
        case value = "Au/USD"
    }
    
    init(date: Date, value: Double) {
        self.date = date
        self.value = value
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        // Decode date string to a Date object
        let dateString = try container.decode(String.self, forKey: .date)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd, yyyy"
        
        guard let date = dateFormatter.date(from: dateString) else {
            throw DecodingError.dataCorruptedError(forKey: .date, in: container, debugDescription: "Date string does not match format expected by formatter.")
        }
        let calendar = Calendar(identifier: .gregorian)
        let components = calendar.dateComponents([.year, .month, .day], from: date)
        guard let year = components.year, let month = components.month, let day = components.day else {
            throw DecodingError.dataCorruptedError(forKey: .date, in: container, debugDescription: "Unable to extract components from date.")
        }
        let customDate = Date(year: year, month: month, day: day)
        
        // Decode gold string to a Decimal
        let goldString = try container.decode(String.self, forKey: .value)

        guard !goldString.isEmpty else {
            self.date = customDate
            self.value = 0.0
            return
        }

        let cleanedAmount = goldString.replacingOccurrences(of: "$", with: "").replacingOccurrences(of: ",", with: "")
        guard let doubleValue = Double(cleanedAmount) else {
            throw DecodingError.dataCorruptedError(forKey: .value, in: container, debugDescription: "Gold string does not represent a valid number.")
        }
        self.date = customDate
        self.value = doubleValue
    }
}


extension Date{
    
    init(year:Int,month:Int,day:Int){
        let calender = Calendar(identifier: .gregorian)
        var components = DateComponents()
        components.year = year
        components.month = month
        components.day = day
        self = calender.date(from: components)!
    }
    
    public func toString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.string(from: self)
    }
    
    func isSameDay(as otherDate: Date) -> Bool {
        let calendar = Calendar.current
        return calendar.isDate(self, inSameDayAs: otherDate)
    }
}

