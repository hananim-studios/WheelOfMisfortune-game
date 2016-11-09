//
//  File.swift
//  WheelOfMisfortune
//
//  Created by Matheus Martins on 11/8/16.
//  Copyright © 2016 hananim-studios. All rights reserved.
//

import Foundation
import SwiftyJSON

class CardsJSON {
    static func cardAtGroup(group: Int, andIndex index: Int) -> Card? {
        do {
            let path = Bundle.main.path(forResource: "Cards", ofType: "json")
                
            let data = try NSData(contentsOf: NSURL(fileURLWithPath: path!) as URL, options: .mappedIfSafe)
                
            let json = JSON(data: data as Data)
        
            return Card(json: json["cards"][group][index])
        } catch {
            return nil
        }
    }
}
