//
//  FooterView.swift
//  AFriendlyReminder
//
//  Created by Chelsea Crawford on 27/06/2024.
//

import SwiftUI



struct FooterView: View {
    
    @State private var selectedPage: SelectedPage = .home
    
    var doNothing: () -> Void
    
    var body: some View {
        NavigationView {
            VStack {
                
                // Main content
                contentView
                
                // Footer
                footerView
            }
            .navigationBarTitle(displayTitle, displayMode: .inline)
        }
    }
    
    private var contentView: some View {
        Group {
            switch selectedPage {
            case .home:
                HomeView()
            case .calendar:
                CalendarView()
            case .friend:
                FriendListView()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(.systemBackground))
    }
    
    private var footerView: some View {
        HStack {
            Spacer()
            navigationButton(iconName: "calendar", targetPage: .calendar)
            Spacer()
            navigationButton(iconName: "house", targetPage: .home)
            Spacer()
            navigationButton(iconName: "person", targetPage: .friend)
        }
        .padding()
        .background(.teal)
        .edgesIgnoringSafeArea(.bottom)
        .shadow(color: .gray, radius: 10)
    }
    
    private func navigationButton(iconName: String, targetPage: SelectedPage) -> some View {
        Button(action: {
            withAnimation(.easeInOut(duration: 0.5)) {
                selectedPage = targetPage
            }
        }) {
            VStack {
                if selectedPage == targetPage {
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
                    .padding(14)
                    .scaleEffect(selectedPage == targetPage ? 1.2 : 1.0)
            }
        }
    }
    
    private var displayTitle: String {
        switch selectedPage {
        case .home:
            return "Home"
        case .calendar:
            return "Calendar"
        case .friend:
            return "Friend List"
        }
    }
}

struct FooterView_Previews: PreviewProvider {
    static var previews: some View {
        FooterView(doNothing: {})
    }
}
