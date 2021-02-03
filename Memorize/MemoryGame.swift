//
//  MemoryGame.swift
//  Memorize
//
//  Created by Deirdre Saoirse Moen on 1/27/21.
//

import Foundation

class MemoryGame<CardContent> {

    private(set) var cards: Array<Card>

    init(pairs: Int, makeCardContent: (Int) -> CardContent) {
        cards = []
        for index in 0..<pairs {
            let content = makeCardContent(index)
            cards.append(Card(id: index * 2, content: content))
            cards.append(Card(id: index * 2 + 1, content: content))
        }
        cards.shuffle()
    }

    func choose(_ cardIndex: Int) {
        cards[cardIndex].isFaceUp = !cards[cardIndex].isFaceUp
    }

    struct Card: Identifiable, Equatable {
        var id: Int
        
        var isFaceUp = false
        var isMatched = false
        var content: CardContent
        
        static func == (lhs: Card, rhs: Card) -> Bool {
            return lhs.id == rhs.id
        }
        
    }


}
