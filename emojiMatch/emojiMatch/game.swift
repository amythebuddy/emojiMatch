//
//  game.swift
//  emojiMatch
//
//  Created by StudentAM on 3/12/24.
//

import SwiftUI

struct game: View {
    let columns: [GridItem] = [
        GridItem(.fixed(70), spacing: 30, alignment: nil),
        GridItem(.fixed(70), spacing: 30, alignment: nil),
        GridItem(.fixed(70), spacing: 30, alignment: nil)
    ]
    @State var cardsFlipped: [Bool] = Array(repeating: false, count: 12)

    @State var emojis = ["😀", "😀" ,"😁", "😁", "😂", "😂", "🤣", "🤣", "😃", "😃", "😄", "😄"].shuffled()

    @State private var pickOne: Int = -1

    @State private var pickTwo: Int = -1

    @State private var score: Int = 0
    
    @State private var gameFinished: Bool = false
    var body: some View {
        NavigationView {
            VStack {
                Text("Custom Score: \(score)")
                    .font(Font.custom("MadimiOne-Regular", size: 30))
                    .navigationBarBackButtonHidden(true)
                LazyVGrid(columns: columns) {
                    ForEach(emojis.indices, id: \.self) { index in
                        BlueCardView(emoji: emojis[index], isTapped: cardsFlipped[index], onTap: {
                            tappedCards(index: index) // Activate tappedCards function
                        })
                    }
                }
            }

                if score == 6 {
                    NavigationLink(destination: endGame(), label: { Text("Next") })
                        .foregroundColor(.white)
                        .padding(20)
                        .font(Font.custom("MadimiOne-Regular", size: 40))
                    
                }

        }
    }
    func tappedCards(index: Int){
        if pickOne == -1 { // if pickOne is not clicked
            pickOne = index // pickOne got that index
            cardsFlipped[index] = true
        } else {
            pickTwo = index
            cardsFlipped[index] = true
        }
        if pickOne != -1 && pickTwo != -1 { //if pickOne and pickTwo are chosen
            if emojis[pickOne] == emojis[pickTwo]{
                score += 1
                pickOne = -1
                pickTwo = -1
            } else {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.75){
                    cardsFlipped[pickOne] = false
                    cardsFlipped[pickTwo] = false
                    pickOne = -1
                    pickTwo = -1
                }
            }
        }
        if score == 6 {
            gameFinished = true
        }
    }
}
struct BlueCardView : View{
    var emoji = ""
    var isTapped: Bool
    var onTap: (() -> Void)? // provide a block of code for BlueCardView in the game struct
    var body : some View {
        ZStack {
            RoundedRectangle(cornerRadius: 5)
                .fill(isTapped ? Color.clear : Color.blue )
                .frame(height: 70)
                .padding(.vertical, 5)
                .onTapGesture {
                    onTap?()
                }
            if isTapped {
                Text("\(emoji)")
                    .padding()
                    .font(.system(size: 30))
                
            }
        }

    }
}

#Preview {
    game()
}
