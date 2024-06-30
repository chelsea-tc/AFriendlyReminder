//
//  SelectedPage.swift
//  AFriendlyReminder
//
//  Created by Chelsea Crawford on 28/06/2024.
//

import SwiftUI

enum SelectedPage: Int {
    case home = 0, calendar, friend
}

class SelectedPageState: ObservableObject {
    @Published var selectedPage: SelectedPage = .home
}
