//
//  endGame.swift
//  emojiMatch
//
//  Created by Nguyen Huyen on 3/18/24.
//

import SwiftUI

struct endGame: View {
    var body: some View {
        NavigationView {
            ZStack {
                Image("background") // create a background
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    Text("Great Job!")
                        .font(.system(size: 50))
                        .padding()
                        .foregroundColor(.white)
                    NavigationLink(destination: game(), label: { Text("Play Again") })
                        .foregroundColor(.white)
                        .padding(.horizontal, 40)
                        .font(Font.custom("MadimiOne-Regular", size: 50))
                        .background(.blue)
                        .cornerRadius(10)
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    endGame()
}
