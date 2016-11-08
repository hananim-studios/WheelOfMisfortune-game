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
    
    var moral: Int = 0
    var money: Int = 0
    var order: Int = 0
    var power: Int = 0
    
    func start() {

    }
}
