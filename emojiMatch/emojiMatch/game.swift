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
    ] // create variable for layout
    @State var cardsFlipped: [Bool] = Array(repeating: false, count: 12)

    @State var emojis = ["😀", "😀" ,"😁", "😁", "😂", "😂", "🤣", "🤣", "😃", "😃", "😄", "😄"].shuffled()

    @State private var pickOne: Int = -1 // for the first pick

    @State private var pickTwo: Int = -1 // for the second pick

    @State private var score: Int = 0
    
    var body: some View {
        NavigationView {
            ZStack {
                Image("background") // create a background
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    Text("Current Score: \(score)") // keep track of the score
                        .font(Font.custom("MadimiOne-Regular", size: 30))
                        .foregroundColor(.white)
                    LazyVGrid(columns: columns) { // create layout
                        ForEach(emojis.indices, id: \.self) { index in // for each emoji in the array, create a blue card out of it
                            BlueCardView(emoji: emojis[index], isTapped: cardsFlipped[index], onTap: { //isTapped checks if the card is flipped
                                tappedCards(index: index) // Activate tappedCards function
                            })
                        }
                    }
                    if score == 6 { // if score equals 6
                        HStack { // create 2 buttons
                            NavigationLink(destination: endGame(), label: { Text("Next") })
                                .foregroundColor(.white)
                                .padding(.horizontal, 30)
                                .font(Font.custom("MadimiOne-Regular", size: 40))
                                .background(.blue)
                                .cornerRadius(10)
                            NavigationLink(destination: game(), label: { Text("Retry") })
                                .foregroundColor(.white)
                                .padding(.horizontal, 30)
                                .font(Font.custom("MadimiOne-Regular", size: 40))
                                .background(.blue)
                                .cornerRadius(10)
                        }
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
    func tappedCards(index: Int){
        if pickOne == -1 { // if pickOne is not clicked
            pickOne = index // pickOne got that index
            cardsFlipped[index] = true // flip the card
        } else {
            pickTwo = index // pickTwo got that index
            cardsFlipped[index] = true // flip the card
        }
        if pickOne != -1 && pickTwo != -1 { //if pickOne and pickTwo are chosen
            if emojis[pickOne] == emojis[pickTwo]{ // if they are the same emoji
                score += 1 // increase the score
                // reset the pick
                pickOne = -1
                pickTwo = -1
            } else {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.75){
                    // flip the card back
                    cardsFlipped[pickOne] = false
                    cardsFlipped[pickTwo] = false
                    // reset the pick
                    pickOne = -1
                    pickTwo = -1
                }
            }
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
                .fill(isTapped ? Color.clear : Color.blue ) // if the user clicked a card, color becomes clear else, color is blue
                .frame(height: 70)
                .padding(.vertical, 5)
                .onTapGesture { // for the user to click on
                    onTap?() // create a block of code
                }
            if isTapped { // if the user click, the emoji appears
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
