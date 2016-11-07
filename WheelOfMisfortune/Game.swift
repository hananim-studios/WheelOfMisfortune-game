//
//  Game.swift
//  WheelOfMisfortune
//
//  Created by Matheus Martins on 11/7/16.
//  Copyright © 2016 hananim-studios. All rights reserved.
//

import Foundation

protocol GameDelegate {
    
}

class Game: CardDelegate {
    
    var cards: [Card] = []
    
    var moral: Int = 0
    var money: Int = 0
    var order: Int = 0
    var power: Int = 0
    
    func start() {
        self.cards = getRandomCards(quantity: 5)
    }
    
    func getRandomCards(quantity: Int) -> [Card] {
        // TODO
        return []
    }
    
    func didAcceptCard(card: Card) {
        
        self.moral += card.moralImpact
        self.money += card.moneyImpact
        self.order += card.orderImpact
        self.power += card.powerImpact
    }
}
