//
//  EmojiGameView.swift
//  Memorize
//
//  Created by Deirdre Saoirse Moen on 1/26/21.
//

import SwiftUI

struct CardView: View {
    // not updating if enclosed in a LazyVGrid unless I also push
    // viewModel down the stack.
    @ObservedObject var viewModel: EmojiMemoryGame
    var cardIndex: Int

    private var card: MemoryGame<String>.Card {
            viewModel.cards[cardIndex]
    }

    var body: some View {

        ZStack {
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.white)
                RoundedRectangle(cornerRadius: 10)
                    .stroke(lineWidth: 3.0)
                Text(card.content)
            } else {
                RoundedRectangle(cornerRadius: 10)
                    .fill()
            }
        }
        .foregroundColor(Color.orange)
        .aspectRatio(2/3, contentMode: .fit)
    }
}

// struct cardPixieDust: ViewModifier {
//    let isFaceUp: Bool
//
//
// }

struct EmojiGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame

    var gridItems: [GridItem] = [GridItem(), GridItem(), GridItem()]

    var body: some View {
        VStack {
            Text("Greetings EmojiGame Player")
            LazyVGrid(columns: gridItems) {
                ForEach(0 ..< viewModel.cards.count) { card in
                    CardView(viewModel: viewModel, cardIndex: card)
                    .onTapGesture {
                        viewModel.choose(viewModel.cards[card])
                    }
                }
            }
        }
        .font(viewModel.cards.count > 8 ? .title : .largeTitle)
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        EmojiGameView(viewModel: game)
    }
}
