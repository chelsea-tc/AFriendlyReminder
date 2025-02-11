//
//  FooterView.swift
//  AFriendlyReminder
//
//  Created by Chelsea Crawford on 27/06/2024.
//

import SwiftUI

struct FooterView: View {
    
    @EnvironmentObject var selectedPageState: SelectedPageState

    var body: some View {
        HStack {
            Spacer()
            navigationButton(iconName: "calendar", targetPage: .calendar)
            Spacer()
            navigationButton(iconName: "house", targetPage: .home)
            Spacer()
            navigationButton(iconName: "person", targetPage: .friend)
            Spacer()
        }
        .background(Theme.periwinkle.mainColor)
        .edgesIgnoringSafeArea(.bottom)
    
    }
    
    private func navigationButton(iconName: String, targetPage: SelectedPage) -> some View {
        Button(action: {
            withAnimation(.easeInOut(duration: 0.5)) {
                selectedPageState.selectedPage = targetPage
            }
        }) {
            VStack {
                if selectedPageState.selectedPage == targetPage {
                    Rectangle()
                        .fill(.white)
                        .frame(height: 4)
                } else {
                    Rectangle()                                   .fill(Color.clear)
                        .frame(height: 4)
                }
                Image(systemName: iconName)
                    .imageScale(.large)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(16)
                    .scaleEffect(selectedPageState.selectedPage == targetPage ? 1.2 : 1.0)
            }
        }
    }
}

struct FooterView_Previews: PreviewProvider {
    static var previews: some View {
        FooterView()
            .environmentObject(SelectedPageState())
    }
}
