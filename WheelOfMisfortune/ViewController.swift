//
//  ViewController.swift
//  WheelOfMisfortune
//
//  Created by Matheus Martins on 11/7/16.
//  Copyright © 2016 hananim-studios. All rights reserved.
//

import UIKit
import SwiftyJSON

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        do {
            let path = Bundle.main.path(forResource: "Cards", ofType: "json")
        
            let data = try NSData(contentsOf: NSURL(fileURLWithPath: path!) as URL, options: .mappedIfSafe)
        
            let json = JSON(data: data as Data)
            
            let card = Card(json: json["cards"][0][0])
            
            print(card.description)
        } catch {
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

