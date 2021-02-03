//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Deirdre Saoirse Moen on 1/27/21.
//

import Foundation

func makeCardContent(index: Int) -> String {
    return "😡"
}

class EmojiMemoryGame: ObservableObject {
    typealias Game = MemoryGame<String>

    @Published var game: Game = EmojiMemoryGame.createGame()
    static var emojis: Array<String> = ["🧜🏻‍♀️", "🐬", "🐙", "🌈", "🏄🏻‍♀️"] // moved outside for testing

    static func createGame(_ numPairs: Int = 0) -> Game {
        let pairs = numPairs >= 2 ? numPairs <= 5 ? numPairs : Int.random(in: 2...5) : Int.random(in: 2...5)
        return Game(pairs: emojis.count) { index in
            return emojis[index]
        }
    }

    var cards: Array<Game.Card> {
        game.cards
    }

    func choose(_ cardIndex: Int) {
        game.choose(cardIndex)
    }
}
