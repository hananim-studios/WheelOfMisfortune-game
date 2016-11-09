//
//  Card.swift
//  WheelOfMisfortune
//
//  Created by Matheus Martins on 11/7/16.
//  Copyright © 2016 hananim-studios. All rights reserved.
//

import Foundation
import SwiftyJSON

enum CardAction {
    
    case None
    
    case AddMoral(moral: Int)
    case AddMoney(money: Int)
    case AddOrder(order: Int)
    case AddPower(power: Int)
    
    case ShowCard(group: Int, id: Int)
    
    init(tuple: (key: String, value: JSON)) {
        switch(tuple.key) {
        case "addMoral":
            self = CardAction.AddMoral(moral: tuple.value.intValue)
        case "addMoney":
            self = CardAction.AddMoney(money: tuple.value.intValue)
        case "addOrder":
            self = CardAction.AddOrder(order: tuple.value.intValue)
        case "addPower":
            self = CardAction.AddPower(power: tuple.value.intValue)
        case "showCard":
            if let array = tuple.value.array {
                self = CardAction.ShowCard(group: array[0].intValue,
                                           id: array[1].intValue)
            } else {
                fatalError("Malformed JSON")
            }
        default:
            self = CardAction.None
        }
    }
}

protocol CardDelegate {
    func didAcceptCard(card: Card)
}

class Card {
    var delegate: CardDelegate? = nil
    
    var title: String = "@Card_Title"
    var text: String = "@Card_Text"
    
    var acceptActions: [CardAction] = []
    var declineActions: [CardAction] = []
    
    var description: String {
        get {
            return "\(self.title)\n".appending(
                   "-\n\(self.text)\n").appending(
                   "-\n\(self.acceptActions)\n").appending(
                   "-\n\(self.declineActions)")
        }
    }
    
    func accept() {
        self.delegate?.didAcceptCard(card: self)
    }
    
    init(json: JSON) {
        
        // NAME AND TEXT
        if let title = json["title"].string {
            self.title = title
        } else {
            fatalError("Malformed JSON")
        }
        
        if let text = json["text"].string {
            self.text = text
        } else {
            fatalError("Malformed JSON")
        }
        
        // ACTIONS
        
        if let acceptActions = json["acceptActions"].dictionary {
            for actionJson in acceptActions {
                self.acceptActions.append(CardAction(tuple: actionJson))
            }
        }
        
        if let declineActions = json["declineActions"].dictionary {
            for actionJson in declineActions {
                self.declineActions.append(CardAction(tuple: actionJson))
            }
        }
    }
}
