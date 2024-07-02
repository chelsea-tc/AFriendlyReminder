//
//  HomeView.swift
//  AFriendlyReminder
//
//  Created by Chelsea Crawford on 28/06/2024.
//
import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            Image("anopaquelogo")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Text("Your next reminder: 12/02/24 - Friend Name 1".uppercased())
                        .fontWeight(.light)
                        .foregroundColor(.gray)
                        .font(.caption)
                        .padding(40)
                    Spacer()
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
