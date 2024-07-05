//
//  ImportantDate.swift
//  AFriendlyReminder
//
//  Created by Chelsea Crawford on 04/07/2024.
//

import Foundation


struct ImportantDate: Codable {
    
    var id: UUID
    var date: Date
    var frequency: DateFrequency
    
    enum DateFrequency: String, Codable {
        case yearly
        case monthly
        case weekly
        
        var name: String {
            rawValue.lowercased()
        }
        
        var id: String {
            name
        }
    }
    
    var stringFormat: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YY/MM/dd"
        return dateFormatter.string(from: self.date)
    }
    
    
}
