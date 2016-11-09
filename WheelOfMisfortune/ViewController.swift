//
//  ViewController.swift
//  WheelOfMisfortune
//
//  Created by Matheus Martins on 11/7/16.
//  Copyright © 2016 hananim-studios. All rights reserved.
//

import UIKit
import SwiftyJSON

<<<<<<< HEAD
<<<<<<< HEAD
class ViewController: UIViewController, WatchConnectionManagerPhoneDelegate {
=======
=======
>>>>>>> 075389fcb2035b9c91959389d3a473b74f3177d3
class ViewController: UIViewController, GameDelegate {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var portrait: UIImageView!
    
    @IBOutlet weak var moralLabel: UILabel!
    @IBOutlet weak var moneyLabel: UILabel!
    @IBOutlet weak var orderLabel: UILabel!
    @IBOutlet weak var powerLabel: UILabel!
<<<<<<< HEAD
>>>>>>> origin/master
=======
>>>>>>> 075389fcb2035b9c91959389d3a473b74f3177d3

    @IBOutlet weak var textView: UITextView!
    
    var game: Game?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
<<<<<<< HEAD
<<<<<<< HEAD
        ConnectionManager.sharedConnectionManager.delegate = self
=======
=======
>>>>>>> 075389fcb2035b9c91959389d3a473b74f3177d3
        
        game = Game()
        
        game?.delegate = self
        game?.start()
<<<<<<< HEAD
>>>>>>> origin/master
=======
>>>>>>> 075389fcb2035b9c91959389d3a473b74f3177d3
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
<<<<<<< HEAD
<<<<<<< HEAD
    // MARK: WatchConnectivityManagerDelegate
    
    func connectionManager(_ connectionManager: ConnectionManager, updatedWithResponse response: String) {
        DispatchQueue.main.async(execute: {
           //TODO -- atualizar interface
            // response : String representa a resposta recebida do Watch - "0" (Não) ou "1" (Sim)
        })
=======
=======
>>>>>>> 075389fcb2035b9c91959389d3a473b74f3177d3
    func game(game: Game, didShowCard card: Card) {
        
        self.titleLabel.text = card.title
        self.textView.text = card.text
        
        self.moralLabel.text = game.moral.description
        self.moneyLabel.text = game.money.description
        self.orderLabel.text = game.order.description
        self.powerLabel.text = game.power.description
    }
    
    @IBAction func declineButtonPressed(_ sender: UIButton) {
        game?.declineCurrentCard()
    }
    

    @IBAction func acceptButtonPressed(_ sender: AnyObject) {
        game?.acceptCurrentCard()
<<<<<<< HEAD
>>>>>>> origin/master
=======
>>>>>>> 075389fcb2035b9c91959389d3a473b74f3177d3
    }
}

