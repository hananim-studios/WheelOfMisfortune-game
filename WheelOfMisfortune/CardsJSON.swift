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
    
    static var json: JSON? = nil
    
    static func load() -> Bool {
        
        do {
            
            let path = Bundle.main.path(forResource: "Cards", ofType: "json")
            
            let data = try NSData(contentsOf: NSURL(fileURLWithPath: path!) as URL, options: .mappedIfSafe)
            
            self.json = JSON(data: data as Data)
            
            return true
        } catch {
            
            return false
        }
    }
    
    static func cardAtGroup(group: Int, andIndex index: Int) -> Card? {
        
        if let json = self.json {
            return Card(json: json["cards"][group][index])
        }
        
        return nil
    }
    
    static func groupCount() -> Int {
        
        if let json = self.json {
            return json["cards"].count
        }
        
        return -1
    }
}
