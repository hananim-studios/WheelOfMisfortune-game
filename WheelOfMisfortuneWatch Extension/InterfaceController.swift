//
//  InterfaceController.swift
//  WheelOfMisfortuneWatch Extension
//
//  Created by Matheus Martins on 11/7/16.
//  Copyright © 2016 hananim-studios. All rights reserved.
//

import WatchKit
import WatchConnectivity


class InterfaceController: WKInterfaceController, WatchConnectionManagerWatchDelegate {

    @IBOutlet var yesButton: WKInterfaceButton!
    @IBOutlet var noButton: WKInterfaceButton!
    @IBOutlet var titleLabel: WKInterfaceLabel!
    @IBOutlet var storyLabel: WKInterfaceLabel!
    @IBOutlet var moralAttributeLabel: WKInterfaceLabel!
    @IBOutlet var moneyAttributeLevel: WKInterfaceLabel!
    @IBOutlet var orderAttributeLabel: WKInterfaceLabel!
    @IBOutlet var powerAttributeLevel: WKInterfaceLabel!
    @IBOutlet var moralImage: WKInterfaceImage!
    @IBOutlet var moneyImage: WKInterfaceImage!
    @IBOutlet var orderImage: WKInterfaceImage!
    @IBOutlet var powerImage: WKInterfaceImage!
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        ConnectionManager.sharedConnectionManager.delegate = self
    }
    
    override func willActivate() {
        super.willActivate()
        
        
    }
    
    override func didDeactivate() {
        super.didDeactivate()
    }
    
    // MARK: WatchConnectivityManagerDelegate

    func connectionManager(_ connectionManager: ConnectionManager, updatedWithCardText text: String, cardTitle title: String, andAttributes attributes: [String]) {
        DispatchQueue.main.async(execute: {
            
            self.storyLabel.setText(text)
            self.titleLabel.setText(title)
            self.moralAttributeLabel.setText(attributes[0])
            self.moneyAttributeLevel.setText(attributes[1])
            self.orderAttributeLabel.setText(attributes[2])
            self.powerAttributeLevel.setText(attributes[3])
        })
    }
    
    // MARK: Interface Actions
    
    var i = 0
    @IBAction func noButtonPressed() {
        i += 1
        updateInterfaceApplicationContext(WithResponse: "0 - \(i)")
        
    }
    @IBAction func yesButtonPressed() {
        i += 1
        updateInterfaceApplicationContext(WithResponse: "1 - \(i)")
    }
    
    // MARK: Convenience
    
    func updateInterfaceApplicationContext(WithResponse response:String) {
        let defaultSession = WCSession.default()
        
        do {
            try defaultSession.updateApplicationContext([
                "response": response,
                ])
        }
        catch let error as NSError {
            print("\(error.localizedDescription)")
        }
    }


    
}
