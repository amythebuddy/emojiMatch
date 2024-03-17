//
//  game.swift
//  emojiMatch
//
//  Created by StudentAM on 3/12/24.
//

import SwiftUI

struct game: View {
    let columns: [GridItem] = [
        GridItem(.fixed(60), spacing: nil, alignment: nil),
        GridItem(.fixed(60), spacing: nil, alignment: nil),
        GridItem(.fixed(60), spacing: nil, alignment: nil)
    ]
    @State var cardsFlipped: [Bool] = Array(repeating: false, count: 12)

    @State var emojis = ["😀", "😀" ,"😁", "😁", "😂", "😂", "🤣", "🤣", "😃", "😃", "😄", "😄"]

    @State private var pickOne: Int = -1

    @State private var pickTwo: Int = -1

    @State private var score: Int = 0
    
    @State private var gameFinished: Bool = false
    var body: some View {
        Text("Custom Score: \(score)")
            .navigationBarBackButtonHidden(true)
        LazyVGrid(columns: columns) {
            ForEach(emojis.indices, id: \.self) { index in
                BlueCardView(emoji: emojis[index], onTap: {
                    tappedCards(index: index) // Activate tappedCards function
                })
            }
        }
    }
    func tappedCards(index: Int){
        if pickOne == -1 { // if pickOne is not clicked
            pickOne = index // pickOne got that index
            cardsFlipped[index] = true
        } else if pickTwo == -1 {
            pickTwo = index
            cardsFlipped[index] = true
        }
        if pickOne != -1 && pickTwo != -1 {
            if emojis[pickOne] == emojis[pickTwo]{
                score += 1
                print(score)
            } else {
                cardsFlipped[pickOne] = false
                cardsFlipped[pickTwo] = false
            }
            pickOne = -1
            pickTwo = -1
        }
        print(cardsFlipped)
    }
}
struct BlueCardView : View{
    var emoji = ""
    var onTap: (() -> Void)? // provide a block of code for BlueCardView in the game struct
    @State private var isTapped = false
    var body : some View {
        ZStack {
            if !isTapped {
                RoundedRectangle(cornerRadius: 5)
                    .fill(Color.blue)
                    .frame(height: 60)
                    .onTapGesture {
                        isTapped.toggle()
                        onTap?()
                    }
            } else {
                Text("\(emoji)")
                    .padding()
            }
        }
    }
}

#Preview {
    game()
}
