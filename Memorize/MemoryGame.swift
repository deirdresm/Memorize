//
//  MemoryGame.swift
//  Memorize
//
//  Created by Deirdre Saoirse Moen on 1/27/21.
//

import Foundation

struct MemoryGame<CardContent> {
    
    var cards: Array<Card>
    
    init(pairs: Int, makeCardContent: (Int) -> CardContent) {
        cards = Array<Card>()
        
        for index in 0..<pairs {
            let content = makeCardContent(index)
            cards.append(Card(id: index * 2, content: content))
            cards.append(Card(id: index * 2 + 1, content: content))
        }
    }

    func choose(_ card: Card) {
        print("card chosen: \(card)")
    }

    struct Card: Identifiable {
        var id: Int
        
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
    }
    
}
