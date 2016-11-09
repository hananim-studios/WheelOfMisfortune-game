//
//  InterfaceController.swift
//  WheelOfMisfortuneWatch Extension
//
//  Created by Matheus Martins on 11/7/16.
//  Copyright © 2016 hananim-studios. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBOutlet var storyLabel: WKInterfaceLabel!
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
    }
    
    override func willActivate() {
        super.willActivate()
    }
    
    override func didDeactivate() {
        super.didDeactivate()
    }

    @IBAction func noButtonPressed() {
        
        animate(withDuration: 0.3) {
            self.storyLabel.setAlpha(0)
        }
        
    }
    @IBAction func yesButtonPressed() {
        
        animate(withDuration: 0.3) {
            self.storyLabel.setAlpha(0)
        }
        
    }
}
