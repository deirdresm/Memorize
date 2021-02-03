//
//  ContentView.swift
//  Memorize
//
//  Created by Deirdre Saoirse Moen on 1/26/21.
//

import SwiftUI

struct CardView: View {
    var card: MemoryGame<String>.Card
    
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
        .aspectRatio(0.6667, contentMode: .fit)
    }
}

struct ContentView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        HStack {
            ForEach(0 ..< viewModel.cards.count) { i in
                CardView(card: viewModel.cards[i])
                    .onTapGesture(perform: { viewModel.choose(i)
                    })
            }
        }
        .font(viewModel.cards.count > 8 ? .title : .largeTitle)
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        ContentView(viewModel: game)
    }
}
