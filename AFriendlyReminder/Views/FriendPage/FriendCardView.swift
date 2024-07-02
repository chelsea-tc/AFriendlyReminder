//
//  FriendCardView.swift
//  AFriendlyReminder
//
//  Created by Chelsea Crawford on 28/06/2024.
//

import SwiftUI

struct FriendCardView: View {

    let name: String
    let next: String
    let time: String
    let category: Category

    
    var body: some View {
        VStack {
            Text("\(name)")
                .font(.headline)
            Spacer()
            VStack {
                Spacer()
                HStack {
                    Text("Category: ")
                    Spacer()
                    Label("\(category.name)", systemImage: category.icon)
                        .labelStyle(.trailingIcon)
                }
                Spacer()
                HStack {
                    Text("Next Reminder: ")
                    Spacer()
                    Label("\(next)", systemImage: "calendar")
                        .labelStyle(.trailingIcon)
                }
                Spacer()
                HStack {
                    Text("Time Range: ")
                    Spacer()
                    Label("\(time)", systemImage: "clock")
                        .labelStyle(.trailingIcon)
                }
                Spacer()
            }
            .font(.caption)
        }
        .padding()
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: 120)
        .cornerRadius(10)
        .foregroundColor(Color.black.opacity(10))
    }
    
}

struct FriendCardView_Previews: PreviewProvider {
    static var category = Category.Close
    static var name = "Test Name 1"
    static var next = "12/3/24"
    static var time = "18:00-19:00"
    static var previews: some View {
        FriendCardView(name: name, next: next, time: time, category: category)
            .background(category.catColor.opacity(0.2))
    }
}
