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
    @State var cardsFlipped: [Bool] = Array(repeating: false, count: 16)

    @State var emojis = ["😀", "😀" ,"😁", "😁", "😂", "😂", "🤣", "🤣", "😃", "😃", "😄", "😄"]

    @State private var pickOne: Int = -1

    @State private var pickTwo: Int = -1

    @State private var score: Int = 0

    @State private var gameFinished: Bool = false
    var body: some View {
        Text("Custom Score: \(score)")
            .navigationBarBackButtonHidden(true)
        LazyVGrid(columns: columns) {
            ForEach(emojis.indices, id: \.self) { emoji in
                BlueCardView(emoji: emojis[emoji])
                
            }
        }
    }
}
struct BlueCardView : View{
    var emoji = ""
    var body : some View {
        ZStack {
            RoundedRectangle(cornerRadius: 5)
                .fill(Color.blue)
                .frame(height: 60)
            Text("\(emoji)")
        }
    }
}

#Preview {
    game()
}
