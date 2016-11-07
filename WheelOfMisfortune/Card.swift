//
//  Card.swift
//  WheelOfMisfortune
//
//  Created by Matheus Martins on 11/7/16.
//  Copyright © 2016 hananim-studios. All rights reserved.
//

import Foundation

protocol CardDelegate {
    func didAcceptCard(card: Card)
}

class Card {
    var delegate: CardDelegate? = nil
    
    var name: String = "Card_Name"
    var text: String = "Card_Text"
    
    var moralImpact: Int = 0
    var moneyImpact: Int = 0
    var orderImpact: Int = 0
    var powerImpact: Int = 0
    
    func accept() {
        self.delegate?.didAcceptCard(card: self)
    }
}
