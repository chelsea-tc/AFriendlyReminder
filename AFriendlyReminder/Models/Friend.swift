//
//  DailyScrum.swift
//  Scrumdinger2
//
//  Created by Chelsea Crawford on 19/03/2024.
//

import Foundation


struct Friend: Identifiable, Codable {
    
    let id: UUID
    var name: String
    var next: String
    var time: String
    var category: Category
    var timeRange: ReminderInterval
    var importantDates : [ImportantDate]
    
    init(id: UUID = UUID(), name: String, next: String, time: String, category: Category) {
        self.id = id
        self.name = name
        self.next = next
        self.time = time
        self.category = category
        self.timeRange = ReminderInterval(startHour: 18, startMinute: 0, endHour: 22, endMinute: 0)
        self.importantDates = []
    }
    
    init(id: UUID = UUID(), name: String, next: String, time: String, category: Category, importantDates: [ImportantDate]) {
        self.id = id
        self.name = name
        self.next = next
        self.time = time
        self.category = category
        self.timeRange = ReminderInterval(startHour: 18, startMinute: 0, endHour: 22, endMinute: 0)
        self.importantDates = importantDates
    }
    
    var timeString: String {
        let start : DateComponents = timeRange.startTime
        let end : DateComponents = timeRange.endTime
        let startString = "\(start.hour ?? 9)" + ":" + "\(start.minute ?? 0)" + "0"
        let endString = "\(end.hour ?? 22)" + ":" + "\(end.minute ?? 0)" + "0"
        return startString + "-" + endString
    }
    
    
}


extension Friend {
    static var importantDate1 = ImportantDate(id: UUID(), date: Date(), frequency: .monthly)
    static var importantDate2 = ImportantDate(id: UUID(), date: Date(), frequency: .yearly)
    static var impList = [importantDate1, importantDate2]
    
    static let sampleFriends: [Friend] =
    [
        Friend(name: "Chelsea Crawford", next: "12/3/24", time: "10:00-16:00", category: Category.Family, importantDates: impList ),
        Friend(name: "John Doe", next: "12/3/24", time: "10:00-16:00", category: Category.Close, importantDates: impList),
        Friend(name: "Jane Doe", next: "12/3/24", time: "10:00-16:00", category: Category.Friend, importantDates: impList),
        Friend(name: "Person Al", next: "12/3/24", time: "10:00-16:00", category: Category.Distant, importantDates: impList)
    ]
}
