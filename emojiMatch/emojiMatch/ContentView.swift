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
                VStack(spacing: 300) { // to create space between EmojiMatch and Start
                    VStack {
                        Text("EmojiMatch")
                            .foregroundColor(.white)
                            .padding(23)
                            .font(Font.custom("MadimiOne-Regular", size: 50))
                    }
                    .background(Color.orange)
                    .cornerRadius(10)
                    VStack{
                        NavigationLink(destination: game(), label: { Text("Start") })
                            .foregroundColor(.white)
                            .padding(20)
                            .font(Font.custom("MadimiOne-Regular", size: 40))
                    }
                    .background(.blue)
                    .cornerRadius(10)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
