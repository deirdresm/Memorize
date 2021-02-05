//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Deirdre Saoirse Moen on 1/27/21.
//

import Foundation

class EmojiMemoryGame: ObservableObject {
    typealias Game = MemoryGame<String>

    @Published var game: Game = EmojiMemoryGame.createGame()
    static var emojis: [String] = ["🧜🏻‍♀️", "🐬", "🐙", "🌈", "🏄🏻‍♀️"] // moved outside for testing

    static func createGame(_ numPairs: Int = 0) -> Game {
        let pairs = numPairs >= 2 ? numPairs <= 5 ? numPairs : Int.random(in: 2...5) : Int.random(in: 2...5)
        return Game(pairs: pairs) { index in
            return emojis[index]
        }
    }

    var cards: [Game.Card] {
        game.cards
    }

    func choose(_ card: Game.Card) {
        objectWillChange.send()
        game.choose(card)
    }
}
