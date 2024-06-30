//
//  Category.swift
//  AFriendlyReminder
//
//  Created by Chelsea Crawford on 29/06/2024.
//

import SwiftUI

enum Category: String, CaseIterable, Identifiable, Codable {
    case Family
    case Close
    case Friend
    case Distant
    
    var days: Int {
        switch self {
            case .Family: return 2
            case .Close: return 4
            case .Friend: return 7
            case .Distant: return 14
        }
    }
    
    var name: String {
        rawValue.capitalized
    }
    
    var id: String {
        name
    }
    
    var icon: String {
        switch self {
        case .Family:
            return "heart.fill"
        case .Close:
            return "heart"
        case .Friend:
            return "bolt.heart.fill"
        case .Distant:
            return "bolt.heart"
        }
    }
    
    var catColor: Color {
        switch self {
        case .Family:
            return Theme.navy.mainColor
        case .Close:
            return Theme.poppy.mainColor
        case .Friend:
            return Theme.teal.mainColor
        case .Distant:
            return Theme.seafoam.mainColor
        }
    }
}
