//
//  MemoryGame.swift
//  Memorize
//
//  Created by Deirdre Saoirse Moen on 1/27/21.
//

import Foundation

struct MemoryGame<CardContent> {

    var cards: [Card]

    init(pairs: Int, makeCardContent: (Int) -> CardContent) {
        cards = [Card]()
        for index in 0..<pairs {
            let content = makeCardContent(index)
            cards.append(Card(id: index * 2, content: content))
            cards.append(Card(id: index * 2 + 1, content: content))
        }
        cards.shuffle()
    }

    mutating func choose(_ card: Card) {
        guard let cardIndex = cards.firstIndex(of: card) else { return }

        cards[cardIndex].isFaceUp = !cards[cardIndex].isFaceUp
        print("card index = \(cardIndex) values: \(cards[cardIndex])")
    }

    struct Card: Identifiable, Equatable {
        var id: Int

        var isFaceUp = true
        var isMatched = false
        var content: CardContent

        static func == (lhs: Card, rhs: Card) -> Bool {
            return lhs.id == rhs.id
        }
    }
}
