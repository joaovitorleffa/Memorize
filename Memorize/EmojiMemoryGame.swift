//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by joaovitor on 25/01/22.
//

// O ViewModel precisa importar o SwiftUI porque faz parte da UI
import SwiftUI

// ViewModel
class EmojiMemoryGame: ObservableObject {
    static let emojisVehicles = ["🚗", "✈️", "🛳", "🚀", "🚠", "🛰", "🚅", "🚘", "🛺", "🚑", "🚜", "⛵️", "🚓", "🛵", "🚲", "🚡", "🚂", "🛩", "🚁", "🚤", "🚊", "🚍", "🏎", "🛶"]
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCard: 4) { pairIndex in
            emojisVehicles[pairIndex]
        }
    }
    
    // model pode ser visto por outras classes e estruturas, mas não podem alterar o seu valor
    // private(set) var model: MemoryGame<String>
    
    @Published private var model: MemoryGame<String> = createMemoryGame()
    
    // 1. Mantemos o model privado, mas expusemos os cards do model para que a UI posso vê-lo. Isso permite que apenas os cards do model sejam visíveis.
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}
