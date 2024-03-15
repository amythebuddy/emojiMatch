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
    
    @State private var isTapped = false

    @State private var gameFinished: Bool = false
    var body: some View {
        Text("Custom Score: \(score)")
            .navigationBarBackButtonHidden(true)
        LazyVGrid(columns: columns) {
            ForEach(emojis.indices, id: \.self) { index in
                Button(action: {
                    tappedCards(index: index)
                    isTapped = true
                }, label: {
                    BlueCardView(emoji: emojis[index], isTapped: isTapped)
                })
                
            }
        }
    }
    func tappedCards(index: Int){
        if pickOne == -1 { // if pickOne is not clicked
            pickOne = index // pickOne got that index
            print(pickOne)
        } else if pickTwo == -1 {
            pickTwo = index
        } else {
            if emojis[pickOne] == emojis[pickTwo]{
                score += 1
                print(score)
            }
            print(emojis[pickOne])
            print(emojis[pickTwo])
            pickOne = -1
            pickTwo = -1
        }
        cardsFlipped[index] = true
    }
}
struct BlueCardView : View{
    var emoji = ""
    var isTapped: Bool
    var body : some View {
        ZStack {
            if !isTapped{
                Text("\(emoji)")
                    .padding()
                RoundedRectangle(cornerRadius: 5)
                    .fill(Color.blue)
                    .frame(height: 60)
            } else {
                Color.clear
            }
        }
    }
}

#Preview {
    game()
}
