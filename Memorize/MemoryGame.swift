//
//  MemoryGame.swift
//  Memorize
//
//  Created by joaovitor on 25/01/22.
//

import Foundation

struct MemoryGame<CardContent> {
    private(set) var cards: [Card]
    
    init(numberOfPairsOfCard: Int, createCardContent: (Int) -> CardContent) {
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsOfCard {
            let content = createCardContent(pairIndex)
            cards.append(Card(content: content))
            cards.append(Card(content: content))
        }
        
    }
    
    func choose(_ card: Card) {
        // TODO: implement choose
    }
    
    // Pode ser acessado como MemoryGame.Card
    // como um Card faz parte de um MemoryGame colocamos a struct Card dentro da struct MemoryGame
    struct Card {
        var isFaceUp = false
        var isMatched = false
        var content: CardContent
    }
}
