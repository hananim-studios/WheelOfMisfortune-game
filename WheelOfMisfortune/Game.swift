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
    
    var nextCardGroup = 0
    var nextCardId = 0
    
    func start() {
        if CardsJSON.load() {
            showCardAtGroup(group: 0, andIndex: 0)
        }
    }
    
    func showCardAtGroup(group: Int, andIndex index: Int) {
        self.currentCard = CardsJSON.cardAtGroup(group: group, andIndex: index)
        self.delegate?.game(game: self, didShowCard: self.currentCard!)
    }
    
    func showRandomCard() {

    }
    
    func acceptCurrentCard() {
        for action in self.currentCard!.acceptActions {
            self.doCardAction(action: action)
        }
        
        self.showCardAtGroup(group: self.nextCardGroup, andIndex: self.nextCardId)
    }
    
    func declineCurrentCard() {
        for action in self.currentCard!.declineActions {
            print(self.currentCard!.declineActions)
            self.doCardAction(action: action)
        }
        
        self.showCardAtGroup(group: self.nextCardGroup, andIndex: self.nextCardId)
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
            self.nextCardId = id
            self.nextCardGroup = group
        case .ShowRandomCard:
            self.nextCardId = 0
            self.nextCardGroup = Int(arc4random_uniform(UInt32(CardsJSON.groupCount())))
            
        default: break
        }
    }
}
