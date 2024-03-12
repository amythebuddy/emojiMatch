//
//  ContentView.swift
//  emojiMatch
//
//  Created by StudentAM on 3/12/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            ZStack {
                Image("emoji")
                VStack {
                    Text("Emoji Match")
                        .foregroundColor(.blue)
                    NavigationLink(destination: game(), label: { Text("Start Game") })
                        .foregroundColor(.white)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
