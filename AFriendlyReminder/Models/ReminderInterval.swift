//
//  ReminderInterval.swift
//  AFriendlyReminder
//
//  Created by Chelsea Crawford on 02/07/2024.
//

import Foundation

struct ReminderInterval: Codable {
    let startTime: DateComponents
    let startHour: Int
    let startMinute: Int
    let endTime: DateComponents
    let endHour: Int
    let endMinute: Int
//    let timeZone: TimeZone
    
    init(startHour: Int, startMinute: Int, endHour: Int, endMinute: Int) {
        let startComp = DateComponents(hour: startHour, minute: startMinute)
        let endComp = DateComponents(hour: endHour, minute: endMinute)
        
        self.startHour = startHour
        self.startMinute = startMinute
        self.startTime = startComp
        self.endHour = endHour
        self.endMinute = endMinute
        self.endTime = endComp
    
    }

}
