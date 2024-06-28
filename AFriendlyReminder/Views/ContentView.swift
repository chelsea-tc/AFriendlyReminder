//
//  ContentView.swift
//  AFriendlyReminder
//
//  Created by Chelsea Crawford on 26/06/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Spacer()
            Text("Hello World")
            Text("Hello World")
            Spacer()
            FooterView(doNothing: {})
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
