//
//  Game.swift
//  WheelOfMisfortune
//
//  Created by Matheus Martins on 11/7/16.
//  Copyright © 2016 hananim-studios. All rights reserved.
//

import Foundation

protocol GameDelegate {
    func game(game: Game, didShowCard card: Card)
}

class Game {
    
    var delegate: GameDelegate?
    
    var moral: Int = 0
    var money: Int = 0
    var order: Int = 0
    var power: Int = 0
    
    var currentCard: Card? = nil
    
    func start() {
        showCardAtGroup(group: 0, andIndex: 0)
    }
    
    func showCardAtGroup(group: Int, andIndex index: Int) {
        self.currentCard = CardsJSON.cardAtGroup(group: group, andIndex: index)
        self.delegate?.game(game: self, didShowCard: self.currentCard!)
    }
    
    func acceptCurrentCard() {
        for action in self.currentCard!.acceptActions {
            self.doCardAction(action: action)
        }
    }
    
    func declineCurrentCard() {
        for action in self.currentCard!.declineActions {
            self.doCardAction(action: action)
        }
    }
    
    func doCardAction(action: CardAction) {
        switch action {
        case let .AddMoral(moral):
            self.moral += moral
        case let .AddMoney(money):
            self.money += money
        case let .AddOrder(order):
            self.order += order
        case let .AddPower(power):
            self.power += power
        case let .ShowCard(group, id):
            self.showCardAtGroup(group: group, andIndex: id)
        default: break
        }
    }
}
