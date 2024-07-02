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
    
    init(id: UUID = UUID(), name: String, next: String, time: String, category: Category) {
        self.id = id
        self.name = name
        self.next = next
        self.time = time
        self.category = category
    }
}


extension Friend {
    static let sampleFriends: [Friend] =
    [
        Friend(name: "Chelsea Crawford", next: "12/3/24", time: "10:00-16:00", category: Category.Family),
        Friend(name: "John Doe", next: "12/3/24", time: "10:00-16:00", category: Category.Close),
        Friend(name: "Jane Doe", next: "12/3/24", time: "10:00-16:00", category: Category.Friend),
        Friend(name: "Person Al", next: "12/3/24", time: "10:00-16:00", category: Category.Distant)
    ]
}
