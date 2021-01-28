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

class EmojiMemoryGame {
    private(set) var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
        
    static func createMemoryGame() -> MemoryGame<String> {
        let emojis: Array<String> = ["🦇", "💩", "🐙"]
        return MemoryGame<String>(pairs: emojis.count) { index in
            return emojis[index]
        }
    }
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }

}
