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

    @IBOutlet var storyLabel: WKInterfaceLabel!
    var response = "-"
    
    
    
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

    func connectionManager(_ connectionManager: ConnectionManager, updatedWithCardText text: String, andTitle title: String) {
        DispatchQueue.main.async(execute: {
            self.storyLabel.setText(text)
        })
    }
    
    // MARK: Interface Actions

    @IBAction func noButtonPressed() {
        response = "0"
        updateInterfaceApplicationContext(WithResponse: response)
        
    }
    @IBAction func yesButtonPressed() {
        response = "1"
        updateInterfaceApplicationContext(WithResponse: response)
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
