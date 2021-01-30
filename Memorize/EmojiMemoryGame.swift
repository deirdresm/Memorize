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
    static var emojis: Array<String> = ["🦇", "💩", "🐙"] // moved outside for testing

    static func createGame() -> Game {

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
